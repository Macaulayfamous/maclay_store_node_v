import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/banner_widget.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/category_item_widget.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/header_widget.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/all_products.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/recommended_product.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/widgets/reuseText_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.13),
        child: const HeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            BannerWidget(),
            const SizedBox(
              height: 20,
            ),
            const CategoryItem(),
            const SizedBox(
              height: 10,
            ),
            const ResuseTextWidget(
                title: 'Recommend for you', subtitle: 'View all'),

            RecommendedProducts(),

            const ResuseTextWidget(title: 'All Products', subtitle: 'View all'),
            AllProductsWidget(),
            // ResuseTextWidget(title: 'Recommend for you', subtitle: 'View all'),
            // RecommendedProduct(),
            // ResuseTextWidget(
            //   title: 'Popular',
            //   subtitle: 'View all',
            // ),
            // PopularProducts(),
          ],
        ),
      ),
    );
  }
}
