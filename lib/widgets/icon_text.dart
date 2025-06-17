import 'package:flutter/material.dart';
import 'package:projeto_/theme/text.dart';

class CustomIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const CustomIconText({super.key, required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 5),
          Text(text, style: AppTextStyles.size12Medium),
        ],
      ),
    );
  }
}


