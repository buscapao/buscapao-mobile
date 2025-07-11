import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/data/models/list_markets.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/shadows.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/widgets/flip_button.dart';

class MarketListHome extends StatelessWidget {
  const MarketListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.symmetricHorizontal10,

          // Titulo destaques
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lista de Mercados',
                style: AppTextStyles.size18Bold(context),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(LucideIcons.listFilter, size: 25),
              ),
            ],
          ),
        ),

        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: AppPadding.symmetricHorizontal10,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: listMarkets.length,
          itemBuilder:
              (context, index) => MarketsItemList(
                logoMarket: listMarkets[index].image,
                nameMarket: listMarkets[index].name,
                check: Img.checkFull,
                rate: 4.6,
                quantityRate: 100,
              ),
        ),
      ],
    );
  }
}

class MarketsItemList extends StatelessWidget {
  final String logoMarket;
  final String nameMarket;
  final String? check;
  final double rate;
  final int quantityRate;
  const MarketsItemList({
    super.key,
    required this.logoMarket,
    required this.nameMarket,
    this.check,
    required this.rate,
    required this.quantityRate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricVertical10,
      child: Row(
        children: [
          //logo do mercado
          Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppShadows.shadowSmall,
            ),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(logoMarket),
              height: 60,
            ),
          ),

          SizedBox(width: 10),

          //Dados sobre o mercado
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //nome do mercado
              Row(
                children: [
                  Text(nameMarket, style: AppTextStyles.size14Bold(context)),
                  SizedBox(width: 5),
                  //icone de verificado
                  Image(image: AssetImage(check!), height: 20),
                ],
              ),
              // avaliação do mercado
              Row(
                children: [
                  //icone de estrela
                  Image(image: AssetImage(Img.star), height: 25),
                  SizedBox(width: 5),
                  //nota do mercado
                  Text(
                    rate.toString(),
                    style: AppTextStyles.size12Medium(context),
                  ),
                  SizedBox(width: 5),
                  //quantidade de avaliacoes
                  Text(
                    '($quantityRate)',
                    style: AppTextStyles.size12Medium(context),
                  ),
                ],
              ),

              // Tipo de entrega
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.border8,
                  color: Colors.greenAccent.withValues(alpha: 0.1),
                ),
                child: Row(
                  children: [
                    Icon(LucideIcons.truck, color: Colors.green, size: 18),
                    SizedBox(width: 5),
                    Text(
                      'Entrega grátis',
                      style: AppTextStyles.size12Medium(
                        context,
                      ).copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Spacer(),

          FlipButton(),
        ],
      ),
    );
  }
}
