import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_/data/models/list_markets.dart';
import 'package:projeto_/data/models/products_list.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/text.dart';

class CarouselProductsHome extends StatelessWidget {
  const CarouselProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadding.symmetricHorizontal10,

          // Titulo destaques
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Produtos em Destaques',
                style: AppTextStyles.size18Bold(context),
              ),

              //Leva pra página de mercados destaque
              TextButton(child: Text('Ver tudo'), onPressed: () {}),
            ],
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: 200,
          child: ListView.separated(
            clipBehavior: Clip.none,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            padding: AppPadding.symmetricHorizontal10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < productsList.length && index < listMarkets.length) {
                return ProductCaroucelItem(
                  imageProduct: productsList[index].image,
                  imageMarket: listMarkets[index].image,
                  nameMarket: listMarkets[index].name,
                  nameProduct: productsList[index].name,
                  priceProduct: productsList[index].price,
                );
              } else {
                return SizedBox();
              }
            },
            itemCount: min(productsList.length, listMarkets.length),
          ),
        ),
      ],
    );
  }
}

class ProductCaroucelItem extends StatelessWidget {
  final String imageProduct;
  final String imageMarket;
  final String nameMarket;
  final String nameProduct;
  final String priceProduct;

  const ProductCaroucelItem({
    super.key,
    required this.imageProduct,
    required this.imageMarket,
    required this.nameMarket,
    required this.nameProduct,
    required this.priceProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: 150,
      padding: AppPadding.symmetricHorizontal10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Imagem do produto
          Container(
            clipBehavior: Clip.none,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withValues(alpha: 0.1),
            ),
            child: Image.asset(imageProduct, height: 80, fit: BoxFit.cover),
          ),

          // mercado
          Row(
            children: [
              //logo do mercado
              ClipOval(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imageMarket),
                  height: 20,
                ),
              ),

              SizedBox(width: 4),

              //nome do mercado
              SizedBox(
                width: 100,
                child: Text(
                  nameMarket,
                  style: AppTextStyles.size12Medium(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),

          SizedBox(height: 8),
          //nome do produto
          Text(
            nameProduct,
            style: AppTextStyles.size14Bold(context),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 8),
          //preco do produto
          Text(
            priceProduct,
            style: AppTextStyles.size16Bold(
              context,
            ).copyWith(color: AppColors.red),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
