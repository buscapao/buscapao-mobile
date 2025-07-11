import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';

class AppTextStyles {
  static const double _fontHeight = 1.1;
  static const double _letterSpacing = -0.24;

  // Define a cor do texto de acordo com o tema (claro ou escuro)
  static Color _getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.white
        : AppColors.black;
  }

  // Aplica responsividade e limita o tamanho mínimo e máximo da fonte
  static double _responsiveSize(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;
    final textScaler = MediaQuery.of(context).textScaler;

    // Aumenta levemente dependendo do tamanho da tela
    double scaled = size;
    if (width < 400) {
      scaled = size * 1; // pequeno aumento em telas pequenas
    } else if (width > 800) {
      scaled = size * 1; // aumento moderado em telas grandes
    } else {
      scaled = size * 1; // aumento padrão em telas médias
    }

    // Aplica TextScaler (acessibilidade) e limita entre 95% e 150% do tamanho original
    final double result = textScaler.scale(scaled);
    return result.clamp(size * 0.95, size * 1.5);
  }

  // ======= SIZE 12 =======
  static TextStyle size12Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 12),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size12Medium(BuildContext context) =>
      size12Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size12Bold(BuildContext context) =>
      size12Normal(context).copyWith(fontWeight: FontWeight.bold);

  // ======= SIZE 14 =======
  static TextStyle size14Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 14),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size14Medium(BuildContext context) =>
      size14Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size14Bold(BuildContext context) =>
      size14Normal(context).copyWith(fontWeight: FontWeight.bold);

  // ======= SIZE 16 =======
  static TextStyle size16Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 16),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size16Medium(BuildContext context) =>
      size16Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size16Bold(BuildContext context) =>
      size16Normal(context).copyWith(fontWeight: FontWeight.bold);

  // ======= SIZE 18 =======
  static TextStyle size18Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 18),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size18Medium(BuildContext context) =>
      size18Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size18Bold(BuildContext context) =>
      size18Normal(context).copyWith(fontWeight: FontWeight.bold);

  // ======= SIZE 24 =======
  static TextStyle size24Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 24),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size24Medium(BuildContext context) =>
      size24Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size24Bold(BuildContext context) =>
      size24Normal(context).copyWith(fontWeight: FontWeight.bold);

  // ======= SIZE 32 =======
  static TextStyle size32Normal(BuildContext context) => TextStyle(
    fontSize: _responsiveSize(context, 32),
    fontWeight: FontWeight.normal,
    letterSpacing: _letterSpacing,
    height: _fontHeight,
    color: _getTextColor(context),
  );

  static TextStyle size32Medium(BuildContext context) =>
      size32Normal(context).copyWith(fontWeight: FontWeight.w500);

  static TextStyle size32Bold(BuildContext context) =>
      size32Normal(context).copyWith(fontWeight: FontWeight.bold);
}
