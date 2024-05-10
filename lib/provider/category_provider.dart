import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> loadCategories() async {
    if (_categories.isNotEmpty) return; // If categories already loaded, return

    try {
      _isLoading = true;
      // notifyListeners();

      _categories = await _categoryService.loadCategories();

      _isLoading = false;
      // notifyListeners();
    } catch (e) {
      // Handle error
      _isLoading = false;
      // notifyListeners();
    }
  }
}
