import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoppingapp/providers/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 29.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p2',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p3',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p5',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p6',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p7',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p8',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p9',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p10',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p11',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p12',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 59.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p13',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 19.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p14',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 49.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p15',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 49.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p16',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 49.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p17',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 49.99,
      quantity: 1,
      isFavorite: false,
    ),
    Product(
      id: 'p18',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      image:
          'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 49.99,
      quantity: 1,
      isFavorite: false,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://projecttest-15371-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((productId, productData) {
        loadedProducts.add(Product(
          id: productId,
          name: productData['name'],
          description: productData['description'],
          image: productData['image'],
          price: productData['price'],
          quantity: productData['quantity'],
          isFavorite: productData['isFavorite'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product value) async {
    const url =
        'https://projecttest-15371-default-rtdb.firebaseio.com/products';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'name': value.name,
            'description': value.description,
            'image': value.image,
            'price': value.price,
            'quantity': value.quantity,
            'isFavorite': value.isFavorite,
          }));
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        name: value.name,
        description: value.description,
        image: value.image,
        price: value.price,
        quantity: value.quantity,
        isFavorite: value.isFavorite,
      );

      _items.insert(0, newProduct); // at the start of the list
      // _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      rethrow;
    }

    // print(json.decode(response.body));
  }

  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((element) => element.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      debugPrint('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
