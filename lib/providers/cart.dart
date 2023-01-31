import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final int quantity;

  Cart(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity});
}
