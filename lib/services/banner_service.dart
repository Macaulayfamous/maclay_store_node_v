import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maclay_shop_node_project/models/banner_model.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';

class BannerService {
  uploadBanner(
      {required File? pickedImage, required  context}) async {
    try {
      // Check if the pickedImage is not null before uploading
      if (pickedImage != null) {
        final cloudinary = CloudinaryPublic('dtsgtdwsu', 'geyvlqqh');

        // Upload the pickedImage
        CloudinaryResponse cloudRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedImage.path, folder: 'banners'),
        );
        String image = cloudRes.secureUrl;

        // Proceed with category upload using the imageUrl
        BannerModel categoryModel = BannerModel(
          id: '',
          image: image,
        );
        http.Response response = await http.post(
          Uri.parse('$uri/api/banner'),
          body: categoryModel.toJson(),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          },
        );
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Category uploaded')));
        }
      } else {
        // Handle the case where image is null
        print('Image is null. Cannot upload category without an image.');
      }
    } catch (e) {
      print('Error uploading category: $e');
      // Handle error accordingly
    }
  }

  //load banner
  Future<List<BannerModel>> loadBanners() async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      print(response.body); // Add this line to print the response body

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
      throw Exception('Error loading categories: $e');
    }
  }
}
