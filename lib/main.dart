import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/auth_screen.dart';
import 'package:shoppingapp/screens/products_overviews_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(
            "",
            "",
            [],
          ),
          update: (context, auth, previousProducts) => Products(
            auth.token!,
            auth.userId!,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders(
            "",
            [],
          ),
          update: (context, auth, previousOrders) => Orders(
            auth.token!,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
          // home: const ProductOverviewScreen(),
          home:
              auth.isAuth ? const ProductOverviewScreen() : const AuthScreen(),
        ),
      ),
    );
  }
}
