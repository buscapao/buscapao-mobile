import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';

import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final IconData? suffixIcon;
  final VoidCallback? iconAction;
  final bool obscureText;
  final Function(String value) onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.suffixIcon,
    this.iconAction,
    required this.obscureText,
    required this.onChanged,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        // bordas
        border: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        // cores
        fillColor: AppColors.white,
        // textos
        hintText: hint,
        labelText: label,
        // estilos de texto
        floatingLabelStyle: AppTextStyles.size18Normal.copyWith(
          color: AppColors.black.withValues(alpha: 0.7),
        ),
        hintStyle: AppTextStyles.size14Normal.copyWith(color: AppColors.grey),
        // icones
        prefixIcon: Icon(icon, color: AppColors.grey),
        suffixIcon: IconButton(
          onPressed: iconAction,
          icon: Icon(suffixIcon, color: AppColors.grey),
        ),
        // propriedades
        isDense: true,
        filled: true,
      ),
    );
  }
}


class SecundaryTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Function(String value) onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const SecundaryTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.onChanged,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),

        //bordas
        border: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.border8,
          borderSide: const BorderSide(color: AppColors.grey),
        ),

        //cores
        fillColor: AppColors.white,

        //textos
        hintText: hint,
        labelText: label,

        //estilos de texto
        floatingLabelStyle: AppTextStyles.size18Normal.copyWith(
          color: AppColors.black.withValues(alpha: 0.7),
        ),
        hintStyle: AppTextStyles.size14Normal.copyWith(color: AppColors.grey),

        //propriedades
        filled: true,
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool enableText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormater;
  final TextAlign textAlign;

  const ProfileTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.enableText,
    this.keyboardType,
    required this.labelText,
    this.inputFormater,
    this.textAlign = TextAlign.start,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyles.size16Medium),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: onChanged,
          textAlign: textAlign,
          controller: controller,
          enabled: enableText,
          keyboardType: keyboardType,
          inputFormatters: inputFormater,
          decoration: InputDecoration(
            prefixIcon:
                icon != null
                    ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(icon, color: AppColors.black),
                    )
                    : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.black),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 0.3),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 0.3),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 0.3),
            ),
          ),
        ),
      ],
    );
  }
}