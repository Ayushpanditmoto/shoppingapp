import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoppingapp/providers/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   name: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   image:
    //       'https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //   price: 29.99,
    //   quantity: 1,
    //   isFavorite: false,
    // ),
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

    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body);
    final List<Product> loadedProducts = [];
    if (extractedData == null) {
      return;
    }
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
  }

  Future<void> addProduct(Product value) async {
    const url =
        'https://projecttest-15371-default-rtdb.firebaseio.com/products.json';
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

  Future<void> updateProduct(String id, Product newProduct) async {
    final productIndex = _items.indexWhere((element) => element.id == id);
    if (productIndex >= 0) {
      //encode convert map to json
      final url =
          'https://projecttest-15371-default-rtdb.firebaseio.com/products/$id.json';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'name': newProduct.name,
            'description': newProduct.description,
            'image': newProduct.image,
            'price': newProduct.price,
          }));

      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      debugPrint('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://projecttest-15371-default-rtdb.firebaseio.com/products/$id.json';
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    http.delete(Uri.parse(url)).then((response) {
      if (response.statusCode >= 400) {
        _items.insert(existingProductIndex, existingProduct!);
        notifyListeners();
        throw const HttpException('Could not delete product.');
      }
      existingProduct = null;
    }).catchError((error) {
      throw error;
    });
    notifyListeners();
  }
}
