class ListMarkets {
  final String id;
  final String name;
  final String image;
  final String? adress;

  ListMarkets({
    this.adress,
    required this.id,
    required this.name,
    required this.image,
  });
}

List<ListMarkets> listMarkets = [
  ListMarkets(
    id: '1',
    name: 'ABC',
    image: 'assets/img/markets/abc.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '2',
    name: 'Mercado Central',
    image: 'assets/img/markets/central.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '3',
    name: 'Dada',
    image: 'assets/img/markets/dada.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '4',
    name: 'GP',
    image: 'assets/img/markets/gp.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '5',
    name: 'Mineirão',
    image: 'assets/img/markets/mineirao.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '6',
    name: 'Luiz Tonin - loja 1',
    image: 'assets/img/markets/tonin.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '7',
    name: 'Luiz Tonin - loja 2',
    image: 'assets/img/markets/tonin.png',
    adress: 'Av. Paulista, 1000',
  ),
  ListMarkets(
    id: '8',
    name: 'Luiz Tonin - atacado',
    image: 'assets/img/markets/tonin.png',
    adress: 'Av. Paulista, 1000',
  ),
];
