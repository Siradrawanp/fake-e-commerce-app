// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartCard extends StatelessWidget {
  final String? id;
  final String? productId;
  final String? title;
  final int? quantity;
  final double? price;
  final String? category;
  final String? image;
  const CartCard({
    Key? key,
    this.id,
    this.productId,
    this.title,
    this.quantity,
    this.price,
    this.category,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CartController _cartController = Get.put(CartController());
    final totalPrice = (price! * quantity!);    
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                image!,
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
            )
          ),
          const SizedBox(height: 4.0,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      category!,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){
                          _cartController.decreaseQuantity(productId!);
                        }, 
                        icon: Icon(Icons.remove_circle_outline_outlined),
                        color: Colors.orange,
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          _cartController.increaseQuantity(productId!);
                        }, 
                        icon: Icon(Icons.add_circle_outline_outlined),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Price :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        totalPrice.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
