import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/helpers/mask.dart';
import 'package:projeto_/theme/buttons.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/shadows.dart';
import 'package:projeto_/widgets/custom_appbar.dart';
import 'package:projeto_/widgets/custom_textfield.dart';
import 'package:flutter/services.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({super.key});

  final List<Map<String, dynamic>> _personalItems = [
    {
      'label': 'Nome',
      'hintText': 'Rafael Cremozinho',
      'keyboardType': TextInputType.name,
      'icon': 'person',
    },
    {
      'label': 'E-mail',
      'hintText': 'e-mail@email',
      'keyboardType': TextInputType.emailAddress,
      'icon': 'mail',
    },
    {
      'label': 'Telefone',
      'hintText': '(00) 00000-0000',
      'keyboardType': TextInputType.phone,
      'formatter': <TextInputFormatter>[PhoneInputFormatter()],
      'icon': 'phone',
    },
    {
      'label': 'CPF',
      'hintText': '000.000.000-00',
      'keyboardType': TextInputType.number,
      'formatter': <TextInputFormatter>[CpfCnpjInputFormatter()],
      'icon': 'id',
    },
  ];

  IconData _getLucideIcon(String iconName) {
    switch (iconName) {
      case 'person':
        return LucideIcons.user;
      case 'id':
        return LucideIcons.idCard;
      case 'phone':
        return LucideIcons.smartphone;
      case 'mail':
        return LucideIcons.mail;
      default:
        return LucideIcons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: 'Meu Perfil'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Foto de perfil
          PersonAvatar(),

          SizedBox(height: 20),

          // Campos do perfil
          ListView.separated(
            padding: AppPadding.symmetricHorizontal20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: _personalItems.length,
            itemBuilder: (context, index) {
              final item = _personalItems[index];
              return ProfileTextField(
                enableText: false,
                labelText: item['label'],
                hintText: item['hintText'],
                keyboardType: item['keyboardType'],
                inputFormater: item['formatter'],
                icon: _getLucideIcon(item['icon']),
              );
            },
          ),

          SizedBox(height: 20),

          Padding(
            padding: AppPadding.symmetricHorizontal20,
            child: PrimaryButton(
              onPressed: () {},
              text: 'Salvar',
              heigh: 50,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        //foto de perfil
        Container(
          padding: EdgeInsets.all(2),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
            boxShadow: AppShadows.shadowSmall,
          ),
          child: ClipOval(child: Image.asset(Img.rafa, fit: BoxFit.cover)),
        ),

        //icone de camera
        Positioned(
          bottom: -5,
          right: 150,
          child: Container(
            padding: const EdgeInsets.all(2),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 2),
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20,
              onPressed: () {},
              icon: Icon(LucideIcons.camera, color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
