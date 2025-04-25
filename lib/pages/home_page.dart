import 'package:coffeeshopui/components/my_bottom_navbar.dart';
import 'package:coffeeshopui/const.dart';
import 'package:coffeeshopui/pages/cart_page.dart';
import 'package:coffeeshopui/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    //shop page
    ShopPage(),

    //cart page
    CartPage(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (index) => navigateBottomNavBar(index),
      ),
      body: _pages[_selectedIndex],

    );
  }
}