import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/data/models/list_historic.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/shadows.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/widgets/container_radius.dart';

// Página de histórico de pedidos
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar da página
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meus Pedidos',
          style: AppTextStyles.size24Medium(
            context,
          ).copyWith(color: AppColors.white),
        ),
      ),

      backgroundColor: AppColors.primaryColor,

      // Corpo da página
      body: ContainerRadius(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),

            // Título do histórico
            Padding(
              padding: AppPadding.symmetricHorizontal10,
              child: Text(
                'Histórico de compras',
                style: AppTextStyles.size18Bold(context),
              ),
            ),

            SizedBox(height: 20),

            // Lista de cards do histórico
            Expanded(
              child: ListView.separated(
                padding: AppPadding.all10,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
                itemCount: orderHistoryList.length,
                itemBuilder: (context, index) {
                  final order = orderHistoryList[index];
                  return CardHistoric(
                    logoMarket: order.marketLogo,
                    nameMarket: order.marketName,
                    imageStatus: order.imageStatus,
                    status: order.status,
                    orderNumber: order.orderNumber,
                    products: order.products,
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card do histórico de pedidos
class CardHistoric extends StatelessWidget {
  final String logoMarket;
  final String nameMarket;
  final String imageStatus;
  final String status;
  final int orderNumber;
  final List<OrderProduct> products;
  final VoidCallback onTap;

  const CardHistoric({
    super.key,
    required this.logoMarket,
    required this.nameMarket,
    required this.imageStatus,
    required this.status,
    required this.orderNumber,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all10,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.border8,
        boxShadow: AppShadows.shadowSmall,
      ),

      // Coluna com todos os dados do card
      child: Column(
        children: [
          // Header do card
          Row(
            children: [
              // Logo do mercado
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

              // Nome do mercado
              Text(nameMarket, style: AppTextStyles.size14Bold(context)),
              SizedBox(width: 5),

              Spacer(),

              // Botão de navegação para detalhes
              IconButton(
                onPressed: () {},
                icon: Icon(LucideIcons.chevronRight, size: 25),
              ),
            ],
          ),

          Divider(color: AppColors.container, thickness: 1),
          SizedBox(height: 10),

          // Linha com status do pedido
          Row(
            children: [
              // Ícone de status
              Image.asset(imageStatus, height: 15),
              SizedBox(width: 10),

              // Texto do status
              Text(status, style: AppTextStyles.size14Bold(context)),
              SizedBox(width: 10),

              // Número do pedido
              Text(
                'N° $orderNumber',
                style: AppTextStyles.size14Medium(
                  context,
                ).copyWith(color: AppColors.black.withValues(alpha: 0.6)),
              ),
            ],
          ),

          SizedBox(height: 10),

          // Lista de produtos do pedido
          Column(
            children:
                products.map((product) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        // Quantidade do produto
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.container,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            product.quantity.toString(),
                            style: AppTextStyles.size14Medium(context),
                          ),
                        ),

                        SizedBox(width: 10),

                        // Nome do produto
                        Expanded(
                          child: Text(
                            product.name,
                            style: AppTextStyles.size14Medium(context).copyWith(
                              color: AppColors.black.withValues(alpha: 0.6),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Preço do produto
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
                          style: AppTextStyles.size14Medium(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),

          Divider(color: AppColors.container, thickness: 1),
          SizedBox(height: 10),

          // Footer do card (botão de repetir pedido)
          Padding(
            padding: AppPadding.symmetricVertical10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    'Detalhes do pedido',
                    style: TextStyle(color: AppColors.red),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  onPressed: onTap,
                  child: const Text('Repetir pedido'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
