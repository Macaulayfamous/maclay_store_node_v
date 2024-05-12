import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/models/sub_category_models.dart';
import 'package:maclay_shop_node_project/services/category_service.dart';
import 'package:maclay_shop_node_project/services/subcategory_service.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/reuseable_search.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/inner_category_screen.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Future<List<CategoryModel>> _categoriesFuture;
  List<SubCategoryModels> _subCategories = [];
  CategoryModel? _selectedCategory;
  @override
  void initState() {
    super.initState();
    _categoriesFuture = CategoryService().loadCategories();
    _categoriesFuture.then((categories) {
      for (var category in categories) {
        if (category.name == "Fashion") {
          setState(() {
            _selectedCategory = category;
          });
          _loadSubCategories(category.name);
          break;
        }
      }
    });
  }

  Future<void> _loadSubCategories(String categoryName) async {
    final subCategories =
        await SubCategoryService().getSubCategoriesByCategoryName(categoryName);
    setState(() {
      _subCategories = subCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const ReusableSearchWidget(),
      ),
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Display categories
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade200,
                child: FutureBuilder<List<CategoryModel>>(
                  future: _categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final categories = snapshot.data!;
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return ListTile(
                            title: Text(
                              category.name,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: _selectedCategory == category
                                    ? Colors.blue
                                    : null,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                              _loadSubCategories(category
                                  .name); // Fetch subcategories by category name
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),

            // Right side - Display selected category details
            Expanded(
              flex: 5,
              child: _selectedCategory != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _selectedCategory!.name,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 150, // Adjust the height of the container
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                _selectedCategory!.banner,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                8), // Adjust the gap between the banner and subcategories
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildSubcategoryRows(),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSubcategoryRows() {
    List<Widget> rows = [];
    List<Widget> currentRow = [];

    for (int i = 0; i < _subCategories.length; i++) {
      final subCategory = _subCategories[i];
      currentRow.add(
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return InnerCatgoryProductsScreen(
                  //         categoryName: subCategory.categoryId);
                  //   }),
                  // );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Image.network(
                      subCategory.image,
                      fit: BoxFit.contain,
                      width: 27,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                subCategory.subcategoryName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

      // Check if we've reached three items or it's the last item
      if ((i + 1) % 3 == 0 || i == _subCategories.length - 1) {
        rows.add(
          Row(
            children: List.from(currentRow),
          ),
        );
        currentRow.clear();
      }
    }
    return rows;
  }
}
