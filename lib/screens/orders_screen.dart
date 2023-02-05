import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widget/order_items.dart';
import '../widget/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // // var _isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //   // Future.delayed(Duration.zero).then((_) async {
  //   //   await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  //   //   setState(() {
  //   //     _isLoading = false;
  //   //   });
  //   // });
  // }

  Future? _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false)
        .fetchAndSetOrders()
        .catchError((error) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('An error occurred!'),
              content: const Text('Something went wrong.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'))
              ],
            );
          });
    });
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      // body: _isLoading
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: ordersData.orders.length,
      //         itemBuilder: (context, index) => OrderItems(
      //           order: ordersData.orders[index],
      //         ),
      //       ),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (context, ordersData, child) => ListView.builder(
                  itemCount: ordersData.orders.length,
                  itemBuilder: (context, index) => OrderItems(
                    order: ordersData.orders[index],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
