import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/products.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/widget/app_drawer.dart';
import 'package:shoppingapp/widget/badge.dart';
import '../providers/cart.dart';
import '../widget/product_grid.dart';
import '../reusable/reusable.dart';

enum FilterOptions { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  // var _isInit = true;
  // var _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<Products>(context, listen: false)
  //       .fetchAndSetProducts()
  //       .then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Products>(context).fetchAndSetProducts();
  //   }
  //   setState(() {
  //     _isInit = false;
  //     _isLoading = false;
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer(builder: (context, Cart cart, child) {
            return Badges(
              color: Theme.of(context).colorScheme.secondary,
              value: cart.itemCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigation.push(
                    context,
                    const CartScreen(),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            );
          }),
          PopupMenuButton(onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.favorites) {
                _showOnlyFavorites = true;
              } else {
                _showOnlyFavorites = false;
              }
            });
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ];
          }),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future:
            Provider.of<Products>(context, listen: false).fetchAndSetProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text('An error occurred!'),
              );
            } else {
              return ProductGrid(
                showFavs: _showOnlyFavorites,
              );
            }
          }
        },
      ),
    );
  }
}
