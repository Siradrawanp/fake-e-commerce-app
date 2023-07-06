// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final totalPrice = (price! * quantity!);    
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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
              ]
            ),
          ),
        ],
      ),
    );
  }
}
