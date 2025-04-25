import 'package:coffeeshopui/images/models/coffeeshop.dart';
import 'package:coffeeshopui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Coffeeshop(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,      
      home: const HomePage(),
    ),
    );
  }
}