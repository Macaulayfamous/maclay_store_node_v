import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/product_model.dart';
import 'package:maclay_shop_node_project/provider/product.dart';
import 'package:maclay_shop_node_project/services/product_service.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, _) {
        if (productProvider.products == null) {
          // If products are not available in the cache, fetch them
          return FutureBuilder<List<ProductModel>>(
            future: fetchProduct(context),
            builder: (context, snapshot) {
              return Builder(
                builder: (context) {
                  // Inside this builder function, you can safely call setState() or markNeedsBuild()
                  // without causing the error
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Shimmer effect while loading
                    return _buildShimmerEffect();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Text('No products found');
                  } else {
                    // Cache the fetched products
                    productProvider.addProducts(snapshot.data!);
                    return _buildProductList(snapshot.data!);
                  }
                },
              );
            },
          );
        } else {
          // If products are available in the cache, use them directly
          return _buildProductList(productProvider.products!);
        }
      },
    );
  }

  Future<List<ProductModel>> fetchProduct(BuildContext context) async {
    // Fetch products from the service
    ProductService _service = ProductService();
    List<ProductModel> products = await _service.loadProducts();
    return products;
  }

  Widget _buildProductList(List<ProductModel> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((productData) {
          return ProductItemWidget(productModel: productData);
        }).toList(),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          // Shimmer effect for each product item
          return _buildShimmerItem();
        }),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 150.0,
      height: 245.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[200]!, Colors.grey[300]!, Colors.grey[200]!],
          stops: const [0.1, 0.5, 0.9],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1200), // Duration of shimmer animation
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.0,
                    height: 15.0,
                    color: Colors.grey[200]!,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 100.0,
                    height: 12.0,
                    color: Colors.grey[200]!,
                  ),
                  const SizedBox(height: 6.0),
                  Container(
                    width: 140.0,
                    height: 12.0,
                    color: Colors.grey[200]!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
