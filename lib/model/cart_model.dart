// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class TotalSpending {
  String id;
  double totPrice;
  TotalSpending({
    required this.id,
    required this.totPrice,
  });
}
