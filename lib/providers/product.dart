import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      this.quantity = 1,
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'price': price,
        'quantity': quantity,
        'isFavorite': isFavorite,
      };

  void toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.put(
        Uri.parse(
            'https://projecttest-15371-default-rtdb.firebaseio.com/userFav/$userId/$id.json?auth=$token'),
        body: json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
