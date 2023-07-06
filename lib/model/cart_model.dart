class CartModel {
  String? id;
  String? title;
  int? quantity;
  dynamic price;
  String? category;
  String? image;
  CartModel({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.category,
    this.image,
  });
}
