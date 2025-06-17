class ProductsList {
  final String id;
  final String name;
  final String? description;
  final String? category;
  final String? subcategory;
  final String price;
  final String image;

  ProductsList({
    required this.id,
    required this.name,
    this.description,
    this.category,
    this.subcategory,
    required this.price,
    required this.image,
  });
}

List<ProductsList> productsList = [
  ProductsList(
    id: '1',
    name: 'Alface',
    description: 'Folhas verdes e crocantes, ideal para saladas.',
    category: 'Hortifruti',
    subcategory: 'Verduras',
    price: 'R\$ 10,00',
    image: 'assets/img/products/alface.png',
  ),
  ProductsList(
    id: '2',
    name: 'Arroz Prato fino - 5kg ',
    description: 'Grãos brancos e soltinhos, essencial na mesa brasileira.',
    category: 'Mercado',
    subcategory: 'Grãos',
    price: 'R\$ 5,50',
    image: 'assets/img/products/arroz.png',
  ),
  ProductsList(
    id: '3',
    name: 'Banana',
    description: 'Fruta doce e nutritiva, ótima para um lanche rápido.',
    category: 'Hortifruti',
    subcategory: 'Frutas',
    price: 'R\$ 6,80',
    image: 'assets/img/products/banana.png',
  ),
  ProductsList(
    id: '4',
    name: 'Cacau em Pó Dr. Oetker - 200g',
    description:
        'Semente utilizada na produção de chocolate e outras delícias.',
    category: 'Ingredientes',
    subcategory: 'Chocolateria',
    price: 'R\$ 15,20',
    image: 'assets/img/products/cacau.png',
  ),
  ProductsList(
    id: '5',
    name: 'Café Pilão Extra forte - 250g',
    description: 'Grãos torrados e moídos, a bebida energética do dia a dia.',
    category: 'Bebidas',
    subcategory: 'Quentes',
    price: 'R\$ 8,90',
    image: 'assets/img/products/cafe.png',
  ),
  ProductsList(
    id: '6',
    name: 'Coca-Cola - 2l',
    description: 'Refrigerante gaseificado com sabor único e refrescante.',
    category: 'Bebidas',
    subcategory: 'Refrigerantes',
    price: 'R\$ 7,00',
    image: 'assets/img/products/coca.png',
  ),
  ProductsList(
    id: '7',
    name: 'Feijão Carioca Pink - 1kg',
    description: 'Grão rico em ferro, acompanha diversos pratos.',
    category: 'Mercado',
    subcategory: 'Grãos',
    price: 'R\$ 7,30',
    image: 'assets/img/products/feijao.png',
  ),
  ProductsList(
    id: '8',
    name: 'Leite desnatado Quatá - 1L',
    description: 'Líquido nutritivo, fonte de cálcio para todas as idades.',
    category: 'Laticínios',
    subcategory: 'Leites',
    price: 'R\$ 4,80',
    image: 'assets/img/products/leite.png',
  ),
  ProductsList(
    id: '9',
    name: 'Leite em Pó itambé - 400g',
    description: 'Leite desidratado, prático e com longa durabilidade.',
    category: 'Laticínios',
    subcategory: 'Leites',
    price: 'R\$ 12,50',
    image: 'assets/img/products/leitepo.png',
  ),
  ProductsList(
    id: '10',
    name: 'Patinho Bovino -kg',
    description: 'Corte magro de carne bovina, ideal para diversas receitas.',
    category: 'Açougue',
    subcategory: 'Bovinos',
    price: 'R\$ 25,00',
    image: 'assets/img/products/patinho.png',
  ),
  ProductsList(
    id: '11',
    name: 'Peito de Frango  PifPaf - 1kg',
    description: 'Carne branca e versátil, essencial para uma dieta saudável.',
    category: 'Açougue',
    subcategory: 'Aves',
    price: 'R\$ 18,70',
    image: 'assets/img/products/peitofrango.png',
  ),
  ProductsList(
    id: '12',
    name: 'Pepsi 2l',
    description: 'Refrigerante sabor cola, uma alternativa refrescante.',
    category: 'Bebidas',
    subcategory: 'Refrigerantes',
    price: 'R\$ 6,50',
    image: 'assets/img/products/pepsi.png',
  ),
  ProductsList(
    id: '13',
    name: 'Skol - 350ml',
    description:
        'Cerveja Pilsen leve e refrescante, perfeita para o dia a dia.',
    category: 'Bebidas',
    subcategory: 'Cervejas',
    price: 'R\$ 3,99',
    image: 'assets/img/products/skol.png',
  ),
  ProductsList(
    id: '14',
    name: 'Sorvete Kibom Flocos - 500g',
    description: 'Sobremesa gelada e cremosa, disponível em diversos sabores.',
    category: 'Congelados',
    subcategory: 'Sobremesas Geladas',
    price: 'R\$ 14,30',
    image: 'assets/img/products/sorvete.png',
  ),
  ProductsList(
    id: '15',
    name: 'Toddynho - 200ml',
    description: 'Achocolatado pronto para beber, saboroso e nutritivo.',
    category: 'Bebidas',
    subcategory: 'Achocolatados',
    price: 'R\$ 2,80',
    image: 'assets/img/products/toddynho.png',
  ),
  ProductsList(
    id: '16',
    name: 'Yakult - 80ml',
    description:
        'Leite fermentado com lactobacilos vivos, para uma flora intestinal saudável.',
    category: 'Laticínios',
    subcategory: 'Iogurtes e Fermentados',
    price: 'R\$ 5,20',
    image: 'assets/img/products/yakult.png',
  ),
];
