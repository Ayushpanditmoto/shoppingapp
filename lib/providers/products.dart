import 'package:flutter/material.dart';
import 'package:shoppingapp/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
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

  void addProduct(Product value) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      name: value.name,
      description: value.description,
      image: value.image,
      price: value.price,
      quantity: value.quantity,
      isFavorite: value.isFavorite,
    );
    _items.add(newProduct);
    _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
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
