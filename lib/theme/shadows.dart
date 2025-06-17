import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> subtleShadow = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 5,
      spreadRadius: 0,
      offset: Offset(0, 1),
    ),
  ];

    static const List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 1,
      spreadRadius: 0.1,
      offset: Offset(0, 1),
    ),
  ];
}