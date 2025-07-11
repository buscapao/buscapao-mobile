import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/widgets/custom_appbar.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: 'Meus Cupons'),
      body: ListView(
        padding: AppPadding.symmetricHorizontal20.copyWith(top: 20),
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.container,
              borderRadius: AppRadius.border8,
            ),
            child: ListTile(
              leading: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Forma circular
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                ),
                child: Image(
                  image: AssetImage(Img.coupom),
                  height: 35,
                  width: 35,
                ),
              ),
              title: Text('Cupom 1', style: AppTextStyles.size16Bold(context)),
              subtitle: Text(
                'Descricao',
                style: AppTextStyles.size14Medium(context),
              ),
              trailing: Icon(
                LucideIcons.chevronRight,
                color: AppColors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
