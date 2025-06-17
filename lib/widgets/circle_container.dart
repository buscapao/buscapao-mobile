import 'package:flutter/material.dart';
import 'package:projeto_/theme/shadows.dart';

class CircleContainer extends StatelessWidget {
  final String image;
  const CircleContainer({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.shadowSmall,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        width: 55,
        height: 55,
        fit: BoxFit.cover,
      ),
    );
  }
}