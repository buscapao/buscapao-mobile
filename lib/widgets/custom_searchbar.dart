import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';

class CustomSearchBar extends StatelessWidget {
  final IconData? iconSerach;
  final String label;
  final IconData? iconScan;
  const CustomSearchBar({
    super.key,
    this.iconSerach,
    required this.label,
    this.iconScan,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: AppPadding.all10,
        border: OutlineInputBorder(
          borderRadius: AppRadius.border24,
          borderSide: const BorderSide(color: Colors.transparent),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border24,
          borderSide: const BorderSide(color: Colors.transparent),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.border24,
          borderSide: const BorderSide(color: Colors.transparent),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border24,
          borderSide: const BorderSide(color: Colors.transparent),
        ),

        hintText: label,
        hintStyle: AppTextStyles.size16Normal(
          context,
        ).copyWith(color: AppColors.grey),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(iconSerach, color: AppColors.grey),
        suffixIcon: Icon(iconScan, color: AppColors.grey),
      ),
    );
  }
}
