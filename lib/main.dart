import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/pages/custom_bottom_navbar.dart';
import 'package:food_delivery/pages/product_details.dart';
import 'package:food_delivery/pages/search.dart';
import 'package:food_delivery/pages/welcom_page.dart';
import 'package:food_delivery/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: AppTheme.lightTheme,
      home: const WelcomePage(),
      routes: {
        '/home': (context) => const CustomBottomNavbar(),
        '/product-details': (context) => const ProductDetails(),
        '/cart': (context) => const CartPage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}
