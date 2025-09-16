import 'package:flutter/material.dart';
import 'package:projeto_/data/models/list_markets.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';

class CarouselMarketHome extends StatelessWidget {
  const CarouselMarketHome({super.key});

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
                'Mercados em Destaques',
                style: AppTextStyles.size18Bold(context),
              ),

              //Leva pra página de mercados destaque
              TextButton(child: Text('Ver tudo'), onPressed: () {}),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Lista  de mercados destaques
        SizedBox(
          height: 135,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            padding: AppPadding.symmetricHorizontal10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => CardMarketHome(
                  image: listMarkets[index].image,
                  name: listMarkets[index].name,
                  address:
                      listMarkets[index].adress ?? 'Endereço não informado',
                ),
            itemCount: listMarkets.length,
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}

class CardMarketHome extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  const CardMarketHome({
    super.key,
    required this.image,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    //Card do mercado
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: AppRadius.border8,
      ),
      child: Padding(
        padding: AppPadding.all10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo do mercado
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image(image: AssetImage(image), height: 60),

                //icone verificado
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image(image: AssetImage(Img.checkFull), height: 20),
                ),
              ],
            ),

            SizedBox(height: 8),

            //nome do mercado
            Flexible(
              child: Text(
                name,
                style: AppTextStyles.size14Bold(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: 4),

            //endereco do mercado
            Text(address, style: AppTextStyles.size12Medium(context)),
          ],
        ),
      ),
    );
  }
}
