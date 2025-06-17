import 'package:flutter/material.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/widgets/custom_appbar.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: 'Meus cartões'),
      body: ListView(
        padding: AppPadding.symmetricHorizontal20.copyWith(top: 20),
        children: [Text('Cartão 1')],
      ),
    );
  }
}
