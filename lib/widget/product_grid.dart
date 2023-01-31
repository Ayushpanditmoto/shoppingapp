import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'product_items.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  const ProductGrid({
    super.key,
    required this.showFavs,
  });

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context);
    final products =
        showFavs ? loadedProducts.favoriteItems : loadedProducts.items;
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // generally navigate to a new screen and pop it lead to memory leak
        // ChangeNotifierProvider.value is used to prevent memory leak
        // ChangeNotifierProvider.value is used when the widget is already built

        value: products[i],
        child: ProductItems(
          key: Key(products[i].id), //key is used to identify the widget
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
