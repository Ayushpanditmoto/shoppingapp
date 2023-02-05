import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/widget/app_drawer.dart';
import '../providers/products.dart';
import '../widget/user_product_item.dart';
import '../reusable/reusable.dart';
import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    //listen: false because we don't want to rebuild the widget when the data changes
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigation.push(context, const EditProductScreen());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => productsData.fetchAndSetProducts(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, index) => Column(
              children: [
                UserProductItems(
                  id: productsData.items[index].id,
                  title: productsData.items[index].name,
                  imageUrl: productsData.items[index].image,
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
