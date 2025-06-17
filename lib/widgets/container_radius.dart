import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';

class ContainerRadius extends StatelessWidget {
  final Widget child;

  const ContainerRadius({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}

class SecondContainerRadius extends StatelessWidget {
  final Widget child;

  const SecondContainerRadius({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
