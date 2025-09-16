import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';

// botao de link/skip
class SkipButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const SkipButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: AppTextStyles.size14Medium(context).copyWith(color: color),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class AppButtonTheme {
  AppButtonTheme._();

  // botao primario
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      splashFactory: InkRipple.splashFactory,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.border8),
      minimumSize: const Size(double.infinity, 56),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
    ),
  );
  //botao secundario
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
      side: const BorderSide(color: AppColors.white),
      splashFactory: InkRipple.splashFactory,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.border8),
      minimumSize: const Size(double.infinity, 56),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
    ),
  );

  // text button
  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
