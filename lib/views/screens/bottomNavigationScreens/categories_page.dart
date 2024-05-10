import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/models/sub_category_models.dart';
import 'package:maclay_shop_node_project/services/category_service.dart';
import 'package:maclay_shop_node_project/services/subcategory_service.dart';

import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryService _categoryService = CategoryService();
  final SubCategoryService _subCategoryService = SubCategoryService();
  late Future<List<CategoryModel>> _categoriesFuture;
  List<SubCategoryModels> _subCategories = [];
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _categoryService.loadCategories();
    _selectedCategory = "Electronic";
    _loadSubCategories(
        _selectedCategory!); // Load subcategories for the default category
  }

  Future<void> _loadSubCategories(String categoryName) async {
    final subCategories =
        await _subCategoryService.getSubCategoriesByCategoryName(categoryName);
    setState(() {
      _subCategories = subCategories
          .where((subCategory) => subCategory.categoryName == categoryName)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder<List<CategoryModel>>(
            future: _categoriesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 6, // Set a fixed count for shimmer effect
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final categories = snapshot.data!;
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      subtitle: Image.network(
                        category.image,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        category.name,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedCategory = category.name;
                          _loadSubCategories(_selectedCategory!);
                        });
                      },
                    );
                  },
                );
              }
            },
          )),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _subCategories.length,
                itemBuilder: (context, index) {
                  final subCategory = _subCategories[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle subcategory tap
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                subCategory.image,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              subCategory.subcategoryName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              'View Products',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
