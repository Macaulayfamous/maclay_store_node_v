import 'dart:convert';

import 'package:maclay_shop_node_project/models/order.models.dart';
import 'package:maclay_shop_node_project/utilities/error_handler/error_handling.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderService {
  Future<void> sendOrder({
    required context,
    required String name,
    required String productName,
    required int productPrice,
    required int discount,
    required int quantity,
    required String category,
    required String image,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');

      if (token == null) {
        // Handle case where user is not authenticated
        return;
      }
      final OrderModel orderModel = OrderModel(
          id: '',
          name: name,
          productName: productName,
          productPrice: productPrice,
          discount: discount,
          quantity: quantity,
          category: category,
          image: image);
      http.Response response = await http.post(
        Uri.parse('$uri/api/orders'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: orderModel.toJson(),
      );

      // Handle response based on success or failure
      if (response.statusCode == 201) {
        // Order created successfully
        // Perform any necessary actions (e.g., show success message)
        showSnackBar(context, 'Order placed successfully');
      } else {
        // Order creation failed
        // Handle failure (e.g., show error message)
        showSnackBar(context, 'Failed to place order: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      showSnackBar(context, 'Error placing order: $e');
    }
  }
}
