import 'package:flutter/material.dart';
import 'package:projeto_/components/grid_category_home.dart';
import 'package:projeto_/screens/page_products.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/widgets/container_radius.dart';
import 'package:projeto_/widgets/custom_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const SecondAppBar(),
      body: ContainerRadius(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: AppPadding.symmetricHorizontal10,
              // Titulo destaques
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categorias', style: AppTextStyles.size18Bold(context)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                clipBehavior:
                    Clip.none, // Permite que os filhos se estendam além dos limites
                // Espaçamento interno
                padding: AppPadding.all10,

                // Número de itens baseado na lista categoryIcons
                itemCount: categoryIcons.length,

                // Construtor de cada item do grid
                itemBuilder: (context, index) {
                  return CategoryLabel(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PageProducts(
                                  categoria: categoryIcons[index]['label'],
                                  imagemCategoria:
                                      categoryIcons[index]['image'],
                                ),
                          ),
                        ),
                    image: categoryIcons[index]['image'],
                    label: categoryIcons[index]['label'],
                  );
                },

                // Configuração do layout do grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 colunas
                  mainAxisSpacing: 12, // Espaço vertical entre itens
                  crossAxisSpacing: 12, // Espaço horizontal entre itens
                  childAspectRatio:
                      2.5, // Proporção largura/altura de cada item
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Lista de categorias com seus respectivos ícones e rótulos
final List<Map<String, dynamic>> categoryIcons = [
  {'image': Img.bebidas, 'label': 'Bebidas'},
  {'image': Img.padaria, 'label': 'Padaria'},
  {'image': Img.limpeza, 'label': 'Produtos de limpeza'},
  {'image': Img.mercearia, 'label': 'Mercearia'},
  {'image': Img.acougue, 'label': 'Açougue'},
  {'image': Img.hortifruti, 'label': 'Hortifruti'},
  {'image': Img.frios, 'label': 'Frios e Laticíonios'},
  {'image': Img.higiene, 'label': 'Higiene pessoal'},
  {'image': Img.pets, 'label': 'Pets'},
  {'image': Img.congelados, 'label': 'Congelados'},
  {'image': Img.snacks, 'label': 'Doces e Snacks'},
  {'image': Img.bebes, 'label': 'Bebê'},
  {'image': Img.outros, 'label': 'Outros'},

  // promo
  {'image': Img.promo, 'label': 'Promoções'},
];
