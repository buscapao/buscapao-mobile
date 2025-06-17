import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/components/carousel_item_home.dart';
import 'package:projeto_/components/carousel_market_home.dart';
import 'package:projeto_/components/carousel_promo_home.dart';
import 'package:projeto_/widgets/container_radius.dart';
import 'package:projeto_/widgets/custom_appbar.dart';
import 'package:projeto_/components/grid_category_home.dart';
import 'package:projeto_/components/market_list_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(),
      body: ContainerRadius(
        child: ListView(
          children: [
            GridCateroryHome(),

            CarouselPromoHome(),

            CarouselMarketHome(),

            CarouselProductsHome(),

            MarketListHome()
          ],
        ),
      ),
    );
  }
}