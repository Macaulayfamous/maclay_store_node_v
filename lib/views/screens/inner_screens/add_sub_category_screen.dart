import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:collection/collection.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/services/category_service.dart';
import 'package:maclay_shop_node_project/services/subcategory_service.dart';

class UploadSubCategory extends StatefulWidget {
  const UploadSubCategory({super.key});

  @override
  State<UploadSubCategory> createState() => _UploadSubCategoryState();
}

class _UploadSubCategoryState extends State<UploadSubCategory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SubCategoryService _subCategoryService = SubCategoryService();
  late String subCategoryName;
  final ImagePicker picker = ImagePicker();
  File? _image;
  List<CategoryModel> _categories = []; // List to hold categories
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadCategories(); // Load categories when the widget initializes
  }

  // Function to load categories
  Future<void> _loadCategories() async {
    try {
      // Fetch categories from the API
      List<CategoryModel> categories = await CategoryService().loadCategories();
      setState(() {
        _categories = categories; // Update the categories list
      });
    } catch (e) {
      print('Error loading categories: $e');
      // Handle error
    }
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('no image picked');
    } else {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    items: _categories.map((CategoryModel category) {
                      return DropdownMenuItem<String>(
                        value: category.id,
                        child: Text(category.name),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select Category',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _image != null
                            ? Image.file(_image!)
                            : const Text(
                                'Upload Image',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          chooseImage();
                        },
                        child: const Text(
                          'Upload Image',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onChanged: (value) {
                      subCategoryName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter category name';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'subcategory Name',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // No need to check for nullability of _selectedCategory
                    if (_formKey.currentState!.validate()) {
                      CategoryModel? selectedCategory =
                          _categories.firstWhereOrNull(
                              (category) => category.id == _selectedCategory);
                      if (selectedCategory != null) {
                        _subCategoryService.uploadSubCategory(
                          context: context,
                          categoryid: selectedCategory.id,
                          categoryName: selectedCategory.name,
                          subcategoryName: subCategoryName,
                          pickedImage: _image,
                        );
                      } else {
                        // Handle case where selected category is not found
                      }
                    }
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
