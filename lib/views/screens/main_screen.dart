import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/cart_screen.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/categories_page.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/home_screen.dart';
import 'package:maclay_shop_node_project/views/screens/bottomNavigationScreens/profiile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const CategoriesPage(),
    const CartScreen(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white.withOpacity(0.95),
            icon: Image.asset(
              'assets/icons/home.png',
              width: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/mart.png',
              width: 25,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 25,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/user.png',
              width: 25,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
