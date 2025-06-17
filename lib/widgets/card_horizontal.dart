import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/shadows.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 120,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: AppRadius.border16,
        boxShadow: AppShadows.subtleShadow,
      ),
      child: Row(
        children: [
          /// Imagem com desconto e favorito
          Container(
            width: 120,
            height: 120,
            padding: AppPadding.all8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                /// imagem
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://ibassets.com.br/ib.item.image.large/l-e6f31072323140d495404980871f7a15.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// desconto
                Positioned(
                  top: 8,
                  left: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.6),
                      borderRadius: AppRadius.border8,
                    ),
                    child: const Text(
                      '25%',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Detalhes
          Expanded(
            child: Padding(
              padding: AppPadding.symmetricHorizontal8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Coquinha Gelada',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Luiz Tonin',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      ClipOval(
                        child: Image.network(
                          'https://ecommerce-image-catalog.s3.us-east-1.amazonaws.com/Luiz+Tonin/Logo/Logo_Tonin_Generica.webp',
                          height: 20,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  /// Preço e botão
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'R\$ 35,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration:  BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(LucideIcons.shoppingCart, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
