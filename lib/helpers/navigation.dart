import 'package:flutter/material.dart';

class Navigation {
  static void navigateTo(BuildContext context, Widget page) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );

  static void replaceCurrent(BuildContext context, Widget page) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
}