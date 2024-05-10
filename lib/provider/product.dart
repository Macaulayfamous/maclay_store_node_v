import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel>? _products;

  List<ProductModel>? get products => _products;

  void addProducts(List<ProductModel> products) {
    _products = products;
    // notifyListeners();
  }
}
