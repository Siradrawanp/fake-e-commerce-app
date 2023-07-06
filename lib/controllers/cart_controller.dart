import 'package:e_comrce_app/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <String, CartModel>{}.obs;

  // Map<String, CartModel> get cartItems {
  //   return {..._cartItems};
  // }

  int get itemCount {
    return cartItems.length;
  }

  void addItems(String productId, String title, dynamic price, String image, String category) {
    if (cartItems.containsKey(productId)) {
      cartItems.update(
        productId, 
        (existingCartItem) => CartModel(
          id: DateTime.now().toString(),
          title: existingCartItem.title,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
          image: existingCartItem.image,
          category: existingCartItem.category,
        ),
      );
    } else {
      cartItems.putIfAbsent(
        productId, 
        () => CartModel(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
          image: image,
          category: category,
        )
      );
    }
  }

  void removeItems(String id) {
    cartItems.remove(id);
  }

  void decreaseQuantity(String id) {
    if (cartItems[id]!.quantity! > 1) {
      cartItems.update(
        id, (existingCartItem) => CartModel(
          id: DateTime.now().toString(),
          title: existingCartItem.title,
          quantity: existingCartItem.quantity! - 1,
          price: existingCartItem.price,
          image: existingCartItem.image,
          category: existingCartItem.category,
        )
      );
    } else {
      removeItems(id);
    }
  }

  void increaseQuantity(String id) {
    cartItems.update(
      id, (existingCartItem) => CartModel(
        id: DateTime.now().toString(),
        title: existingCartItem.title,
        quantity: existingCartItem.quantity! + 1,
        price: existingCartItem.price,
        image: existingCartItem.image,
        category: existingCartItem.category,
      )
    );    
  }

  void clear() {
    cartItems.clear();
  }
}