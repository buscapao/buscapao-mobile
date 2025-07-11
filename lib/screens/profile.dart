import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/screens/address_page.dart';
import 'package:projeto_/screens/card_page.dart';
import 'package:projeto_/screens/coupons_page.dart';
import 'package:projeto_/screens/favorite_page.dart';
import 'package:projeto_/screens/personal_page.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/shadows.dart';
import 'package:projeto_/theme/text.dart';

import 'package:projeto_/widgets/container_radius.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  // Lista de itens do menu de perfil
  final List<Map<String, String>> _menuItems = [
    {
      'title': 'Dados Pessoais',
      'subtitle': 'Informações dos seus dados pessoais',
      'icon': 'person',
    },
    {
      'title': 'Meus Endereços',
      'subtitle': 'Informações do seu endereço',
      'icon': 'mappin',
    },
    {'title': 'Favoritos', 'subtitle': 'Mercados favoritos', 'icon': 'heart'},
    {
      'title': 'Formas de pagamento',
      'subtitle': 'Saldos e cartões',
      'icon': 'credit-card',
    },
    {
      'title': 'Meus cupons',
      'subtitle': 'Informações dos seus cupons',
      'icon': 'ticket',
    },
  ];

  // Mapeia nome do ícone para um ícone Lucide
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'person':
        return LucideIcons.user;
      case 'mappin':
        return LucideIcons.mapPin;
      case 'heart':
        return LucideIcons.heart;
      case 'credit-card':
        return LucideIcons.creditCard;
      case 'ticket':
        return LucideIcons.ticketPercent;
      default:
        return LucideIcons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header com imagem e informações do usuário
            SecondContainerRadius(
              child: Padding(
                padding: AppPadding.symmetricVertical10.copyWith(top: 20),
                child: Column(
                  children: [
                    /// Foto de perfil
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.shadowSmall,
                      ),
                      child: ClipOval(
                        child: Image.asset(Img.rafa, fit: BoxFit.cover),
                      ),
                    ),

                    SizedBox(height: 8),

                    /// Nome do usuário
                    Text(
                      'Cremosinho',
                      style: AppTextStyles.size24Medium(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),

                    SizedBox(height: 4),

                    /// Email do usuário
                    Text(
                      'email@email.com',
                      style: AppTextStyles.size16Medium(
                        context,
                      ).copyWith(color: AppColors.white.withValues(alpha: 0.7)),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),

            // Lista de opções de perfil
            Expanded(
              child: ContainerRadius(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: AppPadding.symmetricHorizontal20.copyWith(top: 40),
                  separatorBuilder:
                      (context, index) => const Divider(height: 1),
                  itemCount: _menuItems.length,
                  itemBuilder: (context, index) {
                    return ProfileItem(
                      icon: _getIconData(_menuItems[index]['icon']!),
                      title: _menuItems[index]['title']!,
                      description: _menuItems[index]['subtitle']!,
                      onTap: () {
                        // Ações ao tocar em cada item
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => PersonalPage()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AddressPage()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => FavoritePage()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => CardPage()),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CouponsPage(),
                              ),
                            );
                            break;
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Componente de item da lista de perfil
class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      onTap: onTap,
      leading: Icon(icon, color: AppColors.black, size: 24),
      title: Text(
        title,
        style: AppTextStyles.size16Medium(
          context,
        ).copyWith(color: AppColors.black),
      ),
      subtitle: Text(
        description,
        style: AppTextStyles.size14Medium(
          context,
        ).copyWith(color: AppColors.black.withValues(alpha: 0.6)),
      ),
      trailing: Icon(
        LucideIcons.chevronRight,
        color: AppColors.black,
        size: 20,
      ),
    );
  }
}
