import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import 'cart_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final ProductController _productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            elevation: 3,
            title: const Text(
              'Le Store',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                }, 
                icon: const Icon(Icons.shopping_cart)
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    if (_.isLoading.value) {
                      return const Center(child: CircularProgressIndicator(),);
                    } if (_.isError.value) {
                      return AlertDialog(
                        title: const Text("Can't fetch API data"),
                        content: const Text(
                          "Please check your internet\n"
                          "or check the API server url\n"
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(), 
                            child: const Text("Close")
                          )
                        ],
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2/3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ), 
                        itemBuilder: (context, index) {
                          return ProductCard(product: _.productList[index]);
                        },
                        itemCount: _.productList.length,
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}