import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/models/product_model.dart';
import 'package:maclay_shop_node_project/services/product_service.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/product_item.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/product_detail.dart';
import 'package:shimmer/shimmer.dart';

class InnerCatgoryProductsScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const InnerCatgoryProductsScreen({super.key, required this.categoryModel});

  @override
  _InnerCatgoryProductsScreenState createState() =>
      _InnerCatgoryProductsScreenState();
}

class _InnerCatgoryProductsScreenState
    extends State<InnerCatgoryProductsScreen> {
  final ProductService productService = ProductService();
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture =
        productService.loadProductsByCategory(widget.categoryModel.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryModel.name,
          style: GoogleFonts.lato(),
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerProducts();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No products found in\n ${widget.categoryModel.name}',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.9,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: (snapshot.data!.length / 3).ceil(),
              itemBuilder: (context, index) {
                final int startIndex = index * 3;
                final int endIndex = startIndex + 3;
                final bool hasMoreItems = endIndex <= snapshot.data!.length;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = startIndex;
                            i < endIndex && i < snapshot.data!.length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: snapshot.data![i],
                                  ),
                                ),
                              );
                            },
                            child: ProductItemWidget(
                              productModel: snapshot.data![i],
                            ),
                          ),
                        if (!hasMoreItems)
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildShimmerProducts() {
    return ListView.builder(
      itemCount: 6, // Placeholder for shimmer effect
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
