import 'package:flutter/material.dart';
import 'package:projeto_/root_page.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/helpers/navigation.dart';

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

//botão com icone de next
class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required PageController controller,
    required this.totalPages,
  }) : _controller = controller;

  final PageController _controller;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await Future.delayed(Duration.zero);

        final int currentPage = _controller.page?.round() ?? 0;

        if (currentPage == totalPages - 1) {
          Navigation.navigateTo(context, const RootPage());
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      style: IconButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: AppColors.white,
        shape: const CircleBorder(),
        backgroundColor: AppColors.black,
        padding: const EdgeInsets.all(12),
      ),
      icon: const Icon(Icons.arrow_forward_ios, size: 20),
    );
  }
}

// botao pricipal
class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double heigh;
  final double width;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.heigh,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(width, heigh),
        splashFactory: InkRipple.splashFactory,
        overlayColor: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: AppRadius.border8),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.size18Medium(
          context,
        ).copyWith(color: AppColors.white),
      ),
    );
  }
}

// botao secundario
class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double heigh;
  final double width;
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.heigh,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        minimumSize: Size(width, heigh),
        splashFactory: InkRipple.splashFactory,
        overlayColor: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: AppRadius.border8),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.size18Medium(
          context,
        ).copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double heigh;
  final double width;
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.heigh,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: AppColors.white,
        minimumSize: Size(width, heigh),
        splashFactory: InkRipple.splashFactory,
        overlayColor: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: AppRadius.border8),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Img.google, height: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyles.size18Medium(
              context,
            ).copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
