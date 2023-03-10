import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/products_overviews_screen.dart';
import 'package:shoppingapp/screens/user_products_screen.dart';
import '../reusable/reusable.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigation.pushReplacement(
                  context, const ProductOverviewScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigation.pushReplacement(context, const OrdersScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigation.pushReplacement(context, const UserProductsScreen());
            },
          )
        ],
      ),
    );
  }
}
