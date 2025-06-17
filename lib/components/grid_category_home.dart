import 'package:flutter/material.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';

// Lista de categorias com seus respectivos ícones e rótulos
final List<Map<String, dynamic>> categoryIcons = [
  {'image': Img.bebidas, 'label': 'Bebidas'},
  {'image': Img.padaria, 'label': 'Padaria'},
  {'image': Img.limpeza, 'label': 'Produtos de limpeza'},
  {'image': Img.promo, 'label': 'Promoções'},
];

class GridCateroryHome extends StatelessWidget {
  const GridCateroryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Altura do grid
      child: GridView.builder(
        clipBehavior: Clip.none, // Permite que os filhos se estendam além dos limites
        shrinkWrap: true, // Reduz o tamanho ao mínimo necessário
        physics: const NeverScrollableScrollPhysics(), // Desabilita a rolagem
        
        // Espaçamento interno
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),

        // Número de itens baseado na lista categoryIcons
        itemCount: categoryIcons.length,

        // Construtor de cada item do grid
        itemBuilder: (context, index) {
          return CategoryLabel(
            image: categoryIcons[index]['image'],
            label: categoryIcons[index]['label'],
          );
        },

        // Configuração do layout do grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 colunas
          mainAxisSpacing: 5, // Espaço vertical entre itens
          crossAxisSpacing: 5, // Espaço horizontal entre itens
          childAspectRatio: 2.5, // Proporção largura/altura de cada item
        ),
      ),
    );
  }
}

class CategoryLabel extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback? onTap;
  
  const CategoryLabel({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.none,
        padding: AppPadding.all10,
        decoration: BoxDecoration(
          color: AppColors.container,
          borderRadius: AppRadius.border8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [

            // Texto label da categoria
            SizedBox(
              width: 120,
              child: Text(
                label,
                style: AppTextStyles.size16Bold,
                softWrap: true,
              ),
            ),

            // Container circular com a imagem
            Container(
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Forma circular
                color: AppColors.primaryColor.withValues(alpha: 0.1),
              ),
              child: Image(image: AssetImage(image), height: 55, width: 40,)
            ),
          ],
        ),
      ),
    );
  }
}