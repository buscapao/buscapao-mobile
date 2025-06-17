import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';

class CarouselPromoHome extends StatefulWidget {
  const CarouselPromoHome({super.key});

  @override
  State<CarouselPromoHome> createState() => _CarouselPromoHomeState();
}

class _CarouselPromoHomeState extends State<CarouselPromoHome> {
  final CarouselSliderController _controller = CarouselSliderController();
  double _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: bannerPromo.length,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayCurve: Curves.fastOutSlowIn,
            height: 150,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollPhysics: const ClampingScrollPhysics(),
            viewportFraction: 0.9,
            padEnds: false,
            pageSnapping: false,
            reverse: false,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPosition = index.toDouble();
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: AppPadding.symmetricHorizontal10,
              child: CarouselItemHome(image: bannerPromo[index]['image']),
            );
          },
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: bannerPromo.length,
          position: _currentPosition,
          decorator: DotsDecorator(
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            activeColor: AppColors.primaryColor,
            size: const Size.square(8),
            activeSize: const Size(8, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: AppRadius.border8,
            ),
            spacing: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}

final List<Map<String, dynamic>> bannerPromo = [
  {'image': Img.promotion1},
  {'image': Img.promotion2},
  {'image': Img.promotion1},
  {'image': Img.promotion2},
];

class CarouselItemHome extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;

  const CarouselItemHome({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppRadius.border8,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: AppRadius.border8),
        child: ClipRRect(
          borderRadius: AppRadius.border8,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}