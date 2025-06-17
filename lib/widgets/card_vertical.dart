import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/shadows.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 280,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: AppShadows.subtleShadow,
        borderRadius: AppRadius.border16,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 180,
            padding: AppPadding.all8,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: AppRadius.border12,
            ),
            child: Stack(
              children: [
                /// Imagem
                ClipRRect(
                  borderRadius: AppRadius.border12,
                  child: Image.network(
                    'https://ibassets.com.br/ib.item.image.large/l-e6f31072323140d495404980871f7a15.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
    
                /// desconto em porcentagem
                Positioned(
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.8),
                      borderRadius: AppRadius.border8,
                    ),
                    child: const Text(
                      '25%',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    
          const SizedBox(height: 8),
    
          /// detalhes
          Padding(
            padding: AppPadding.onlyLeft8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // nome do produto
                const Text(
                  'Coquinha Gelada',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                // mercado e logo
                Row(
                  children: [
                    const Text(
                      'Luiz Tonin',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    ClipOval(
                      child: Image.network('https://ecommerce-image-catalog.s3.us-east-1.amazonaws.com/Luiz+Tonin/Logo/Logo_Tonin_Generica.webp', height: 20, fit: BoxFit.contain),
                    ),
                  ],
                ),
              ],
            ),
          ),
    
          const Spacer(),
    
          /// Preço e botão de adicionar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: AppPadding.onlyLeft8,
                child: Text(
                  'R\$ 35,00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(LucideIcons.plus, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





