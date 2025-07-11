class GetMarketAddress {
  final String street;
  final String neighborhood;
  final String number;
  final int cityID;
  final String complement;
  final String reference;
  final String description;
  final bool main;

  GetMarketAddress({
    required this.street,
    required this.neighborhood,
    required this.number,
    required this.cityID,
    required this.complement,
    required this.reference,
    required this.description,
    required this.main,
  });

  factory GetMarketAddress.fromJson(Map<String, dynamic> json) {
    return GetMarketAddress(
      street: json['street'],
      neighborhood: json['neighborhood'],
      number: json['number'],
      cityID: json['cityID'],
      complement: json['complement'],
      reference: json['reference'],
      description: json['description'],
      main: json['main'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'neighborhood': neighborhood,
      'number': number,
      'cityID': cityID,
      'complement': complement,
      'reference': reference,
      'description': description,
      'main': main,
    };
  }
}
