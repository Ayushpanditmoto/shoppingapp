import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';
import '../reusable/reusable.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    // required this.loadedProducts,
  });

  // final Product loadedProducts;

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Product>(context, listen: false);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: const Color.fromARGB(127, 0, 0, 0),
              leading:
                  Consumer<Product>(builder: (context, loadedProducts, child) {
                return IconButton(
                  onPressed: () {
                    loadedProducts.toggleFavoriteStatus();
                  },
                  icon: Icon(
                    loadedProducts.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                );
              }),
              title: Text(
                loadedProducts.name,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigation.push(context, ProductDetails(id: loadedProducts.id));
              },
              child: Image.network(
                loadedProducts.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Text(
              'NEW',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
