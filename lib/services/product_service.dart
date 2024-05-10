import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:maclay_shop_node_project/models/product_model.dart';
import 'package:maclay_shop_node_project/utilities/error_handler/error_handling.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';

class ProductService {
  void sellerProduct({
    required context,
    required String productName,
    required int productPrice,
    required int quantity,
    required int discount,
    required String description,
    required List<File>? pickedImages,
    required String category, // Ensure category is of type String
  }) async {
    try {
      if (pickedImages != null) {
        final cloudinary = CloudinaryPublic('dtsgtdwsu', 'geyvlqqh');

        List<String> images = [];

        for (var i = 0; i < pickedImages.length; i++) {
          CloudinaryResponse cloudRes = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(pickedImages[i].path, folder: productName),
          );
          images.add(cloudRes.secureUrl);
        }

        print('Category: $category'); // Debug log to check category value

        // Ensure category is not null
        if (category.isNotEmpty) {
          final ProductModel productModel = ProductModel(
              productName: productName,
              productPrice: productPrice,
              quantity: quantity,
              discount: discount,
              description: description,
              images: images,
              category: category, productId: '');

          http.Response response = await http.post(
            Uri.parse('$uri/post/add-product'),
            body: productModel.toJson(),
            headers: <String, String>{
              "Content-Type": 'application/json; charset=UTF-8'
            },
          );
          print(response.body);
          print(response.statusCode);
          if (response.statusCode == 201) {
            httpErrorHandler(
                response: response,
                context: context,
                onSuccess: () {
                  showSnackBar(context, 'Product has been uploaded');
                });
          }
        } else {
          // Handle empty category
          showSnackBar(context, 'Category cannot be empty');
        }
      }
    } catch (e) {
      print('Error uploading category: $e');
      showSnackBar(context, e.toString());
    }
  }

  //get products

  Future<List<ProductModel>> loadProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/products'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      print(response.body); // Add this line to print the response body

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        List<ProductModel> products = data
            .map((product) =>
                ProductModel.fromMap(product as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      throw Exception('Error loading products: $e');
    }
  }
  //load recommended products

   Future<List<ProductModel>> loadRecommendedProduct() async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/recommended-products'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      print(response.body); // Add this line to print the response body

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        List<ProductModel> products = data
            .map((product) =>
                ProductModel.fromMap(product as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      throw Exception('Error loading products: $e');
    }
  }

  //category by products

  
Future<List<ProductModel>> loadProductsByCategory(String category) async {
  try {
    final response = await http.get(
      Uri.parse('$uri/category/products?category=$category'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
    );
    if (kDebugMode) {
      print(response.body);
    } // Add this line to print the response body

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body) as List<dynamic>;
      List<ProductModel> products = data
          .map((product) =>
              ProductModel.fromMap(product as Map<String, dynamic>))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print(e);
    throw Exception('Error loading products: $e');
  }
}

}
