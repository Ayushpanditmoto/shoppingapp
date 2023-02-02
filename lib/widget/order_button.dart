import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class OrderButton extends StatelessWidget {
  final Cart cart;

  const OrderButton({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<Orders>(context, listen: false).addOrder(
          cart.items.values.toList(),
          cart.totalAmount,
        );
        cart.clear();
      },
      child: const Text('ORDER NOW'),
    );
  }
}
