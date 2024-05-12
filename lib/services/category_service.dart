import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';

class CategoryService {
  uploadCategory(
      {required context,
      required String name,
      required File? pickedImage, pickedBanner}) async {
    try {
      // Check if the pickedImage is not null before uploading
      if (pickedImage != null) {
        final cloudinary = CloudinaryPublic('dtsgtdwsu', 'geyvlqqh');

        // Upload the pickedImage
        CloudinaryResponse cloudRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedImage.path, folder: 'categories'),
        );
        String image = cloudRes.secureUrl;

                 // Upload the banner image
        CloudinaryResponse bannerRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedBanner.path, folder: 'banners'),
        );
        String banner = bannerRes.secureUrl;

        // Proceed with category upload using the imageUrl
        CategoryModel categoryModel = CategoryModel(
          id: '',
          name: name,
          image: image,
          banner: banner
        );
        http.Response response = await http.post(
          Uri.parse('$uri/api/categories'),
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

  //get categories

  Future<List<CategoryModel>> loadCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/categories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      print(response.body); // Add this line to print the response body

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<CategoryModel> categories =
            data.map((category) => CategoryModel.fromJson(category)).toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
      throw Exception('Error loading categories: $e');
    }
  }
}
