import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/sub_category_models.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';

class SubCategoryService {
  uploadSubCategory({
    required context,
    required String categoryid,
    required String categoryName,
    required String subcategoryName,
    required File? pickedImage,
  }) async {
    try {
      if (subcategoryName.isNotEmpty && pickedImage != null) {
        final cloudinary = CloudinaryPublic('dtsgtdwsu', 'geyvlqqh');

        // Upload the pickedImage
        CloudinaryResponse cloudRes = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pickedImage.path, folder: 'subcategories'),
        );
        String image = cloudRes.secureUrl;

        // Proceed with category upload using the imageUrl
        SubCategoryModels subcategoryModel = SubCategoryModels(
          categoryId: categoryid,
          categoryName: categoryName,
          image: image,
          subcategoryName: subcategoryName,
          subcategoryId: '',
        );
        http.Response response = await http.post(
          Uri.parse('$uri/api/subcategory'),
          body: subcategoryModel.toJson(),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          },
        );
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Category uploaded')));
        }
      } else {
        print('Subcategory name and image are required.');
      }
    } catch (e) {
      print('Error uploading category: $e');
      // Handle error accordingly
    }
  }
  //get sub category by categoryname

  Future<List<SubCategoryModels>> getSubCategoriesByCategoryName(
      String categoryName) async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/category/$categoryName/subcategories'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        if (responseData.isNotEmpty) {
          return responseData
              .map((data) => SubCategoryModels.fromMap(data))
              .toList();
        } else {
          print('Subcategories not found');
          return [];
        }
      } else if (response.statusCode == 404) {
        print('Category not found');
        return [];
      } else {
        print('Failed to fetch subcategories');
        return [];
      }
    } catch (e) {
      print('Error fetching subcategories: $e');
      return [];
    }
  }
}
