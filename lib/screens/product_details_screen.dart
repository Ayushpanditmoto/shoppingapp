import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final String id;

  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(
      context,
      listen:
          false, // listen: false is used to prevent the widget from rebuilding when the data changes
    ).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Text(product.name),
      ),
    );
  }
}
