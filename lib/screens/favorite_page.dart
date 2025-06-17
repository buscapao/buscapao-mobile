import 'package:flutter/material.dart';
import 'package:projeto_/components/market_list_home.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/widgets/custom_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: 'Meus favoritos'),
      body: ListView(
        padding: AppPadding.symmetricHorizontal20.copyWith(top: 20),
        children: [
          MarketsItemList(
            logoMarket: 'assets/img/markets/abc.png',
            nameMarket: 'ABC',
            check:'assets/img/icones/checkFull.png',
            rate: 4.6,
            quantityRate: 100,
          ),
        ],
      ),
    );
  }
}
