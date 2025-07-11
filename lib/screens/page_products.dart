import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/text.dart';

class PageProducts extends StatelessWidget {
  final String categoria;
  final String imagemCategoria;

  const PageProducts({
    super.key,
    required this.categoria,
    required this.imagemCategoria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoria,
          style: AppTextStyles.size24Medium(
            context,
          ).copyWith(color: AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          color: AppColors.white,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Image.asset(imagemCategoria)),
    );
  }
}
