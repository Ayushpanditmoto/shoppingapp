import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final int quantity;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity,
      this.isFavorite = false});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      isFavorite: json['isFavorite'],
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
