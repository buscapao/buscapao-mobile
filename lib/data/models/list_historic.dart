import 'package:intl/intl.dart';
import 'package:projeto_/theme/img.dart';

class OrderProduct {
  final String name;
  final double price;
  final int quantity;

  OrderProduct({
    required this.name,
    required this.price,
    required this.quantity,
  });

  String get formattedPrice => NumberFormat.currency(
        locale: 'pt_BR',
        symbol: 'R\$',
      ).format(price);
}

class OrderHistory {
  final String marketName;
  final String marketLogo;
  final String status;
  final int orderNumber;
  final List<OrderProduct> products;

  OrderHistory({
    required this.marketName,
    required this.marketLogo,
    required this.status,
    required this.orderNumber,
    required this.products,
  });

  String get imageStatus {
    if (status.toLowerCase().contains('concluido')) {
      return Img.checkCircle;
    } else if (status.toLowerCase().contains('cancelado')) {
      return Img.closeCircle;
    } else {
      return Img.waitCircle;
    }
  }

  int get totalItems => products.fold(0, (sum, p) => sum + p.quantity);

  double get totalPrice =>
      products.fold(0.0, (sum, p) => sum + (p.price * p.quantity));

  String get formattedTotalPrice => NumberFormat.currency(
        locale: 'pt_BR',
        symbol: 'R\$',
      ).format(totalPrice);
}

List<OrderHistory> orderHistoryList = [
  OrderHistory(
    marketName: 'ABC',
    marketLogo: 'assets/img/markets/abc.png',
    status: 'Pedido concluido',
    orderNumber: 10,
    products: [
      OrderProduct(name: 'Leite condensado 350ml', price: 6.25, quantity: 2),
      OrderProduct(name: 'Farinha de trigo 1kg', price: 4.00, quantity: 1),
    ],
  ),
  OrderHistory(
    marketName: 'Mercado Central',
    marketLogo: 'assets/img/markets/central.png',
    status: 'Pedido pendente',
    orderNumber: 42,
    products: [
      OrderProduct(name: 'Cacau em pó 200g', price: 8.90, quantity: 1),
    ],
  ),
  OrderHistory(
    marketName: 'Dada',
    marketLogo: 'assets/img/markets/dada.png',
    status: 'Pedido concluido',
    orderNumber: 15,
    products: [
      OrderProduct(name: 'Café 250g', price: 12.50, quantity: 1),
      OrderProduct(name: 'Açúcar 1kg', price: 5.00, quantity: 1),
    ],
  ),
  OrderHistory(
    marketName: 'GP',
    marketLogo: 'assets/img/markets/gp.png',
    status: 'Pedido cancelado',
    orderNumber: 20,
    products: [
      OrderProduct(name: 'Café 250g', price: 12.50, quantity: 1),
    ],
  ),
  OrderHistory(
    marketName: 'Mineirão',
    marketLogo: 'assets/img/markets/mineirao.png',
    status: 'Pedido pendente',
    orderNumber: 25,
    products: [
      OrderProduct(name: 'Café 250g', price: 12.50, quantity: 1),
      OrderProduct(name: 'Biscoito recheado', price: 3.20, quantity: 3),
    ],
  ),
];
