import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/product_model.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/product_detail.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductItemWidget({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: productModel,
            ),
          ),
        );
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: (productModel.images as List<dynamic>?)
                                ?.isNotEmpty ??
                            false
                        ? productModel.images[0]
                        : '', // Placeholder or default image URL
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                  Positioned(
                    top: 15,
                    right: 2,
                    child: Image.asset(
                      'assets/btn_wishlist.png',
                      width: 30,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/add to cart.png',
                      width: 26,
                      height: 26,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${productModel.discount}',
              style: const TextStyle(
                color: Color(0xFF336699),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 4),
            Text(
              productModel.productName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13.0,
                fontFamily: 'Roboto',
                color: const Color(0xFF212121),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.5),
            Text(
              productModel.category,
              style: TextStyle(
                color: const Color(0xff868D94),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
