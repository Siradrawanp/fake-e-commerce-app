import 'package:e_comrce_app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final CartController _cartController = Get.put(CartController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          automaticallyImplyLeading: true,
          title: const Text(
            'Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ), 
              itemBuilder: (context, index) {
                return CartCard(
                  id: _cartController.cartItems.values.toList()[index].id!,
                  productId: _cartController.cartItems.keys.toList()[index],
                  title: _cartController.cartItems.values.toList()[index].title!,
                  quantity: _cartController.cartItems.values.toList()[index].quantity!,
                  price: _cartController.cartItems.values.toList()[index].price!,
                  image: _cartController.cartItems.values.toList()[index].image!,
                  category: _cartController.cartItems.values.toList()[index].category!,
                );
              },
              itemCount: _cartController.itemCount,
            );
          }),
        ),
      )
    );
  }
}