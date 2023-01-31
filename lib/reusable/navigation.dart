import 'package:flutter/material.dart';

class Navigation {
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
