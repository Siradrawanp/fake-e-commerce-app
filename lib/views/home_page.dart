import 'package:e_comrce_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController _productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}