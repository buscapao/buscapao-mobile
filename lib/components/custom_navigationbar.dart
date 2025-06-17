import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/shadows.dart';
import 'package:projeto_/theme/text.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: AppShadows.subtleShadow,
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
      
            BottomItens(
              index: 0,
              icon: LucideIcons.house400,
              label: 'Home',
              widget: widget,
            ),
            
            BottomItens(
              index: 1,
              icon: LucideIcons.search400,
              label: 'Busca',
              widget: widget,
            ),
      
            BottomItens(
              index: 2,
              icon: LucideIcons.history400,
              label: 'Histórico',
              widget: widget,
            ),
            
            BottomItens(
              index: 3,
              icon: LucideIcons.userRound400,
              label: 'Perfil',
              widget: widget,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomItens extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final CustomNavigationBar widget;
  const BottomItens({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.currentIndex == index;

    return InkWell(
      borderRadius: AppRadius.border16,
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryColor : AppColors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: isSelected
                ? AppTextStyles.size12Medium.copyWith(color: AppColors.primaryColor)
                : AppTextStyles.size12Medium.copyWith(color: AppColors.grey),
          ),
          if (isSelected)
            Container(
              clipBehavior: Clip.none,
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            )
        ],
      ),
    );
  }
}

