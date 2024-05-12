import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:maclay_shop_node_project/provider/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/inner_category_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late Future<void> _categoriesFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    _categoriesFuture = categoryProvider.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return FutureBuilder<void>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        if (categoryProvider.isLoading) {
          return _buildShimmerCategories();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (categoryProvider.categories.isEmpty) {
          return const Text('No categories found');
        } else {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: categoryProvider.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final categoryData = categoryProvider.categories[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return InnerCatgoryProductsScreen(
                          categoryName: categoryData.name);
                    }),
                  );
                },
                child: Container(
                  width: 83,
                  height: 99,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        top: 69,
                        child: SizedBox(
                          width: 83,
                          height: 30,
                          child: Text(
                            categoryData.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        child: Material(
                          type: MaterialType.transparency,
                          borderRadius: BorderRadius.circular(12),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              color: Colors.white,
                              width: 63,
                              height: 63,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 5,
                        child: CachedNetworkImage(
                          imageUrl: categoryData.image,
                          width: 47,
                          height: 47,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _buildShimmerImage(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildShimmerCategories() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6, // Placeholder for shimmer effect
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 83,
            height: 99,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerImage() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 47,
        height: 47,
        color: Colors.white,
      ),
    );
  }
}
