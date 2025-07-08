class City {
  final int cityID;
  final String name;
  final String state;
  final String zipCode;
  final String ibgeCode;
  final String street;
  final String neighborhood;
  final String uf;

  City({
    required this.cityID,
    required this.name,
    required this.state,
    required this.zipCode,
    required this.ibgeCode,
    required this.street,
    required this.neighborhood,
    required this.uf,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityID: json['cityID'],
      name: json['name'],
      state: json['state'],
      zipCode: json['zipCode'],
      ibgeCode: json['ibgeCode'],
      street: json['street'],
      neighborhood: json['neighborhood'],
      uf: json['uf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityID': cityID,
      'name': name,
      'state': state,
      'zipCode': zipCode,
      'ibgeCode': ibgeCode,
      'street': street,
      'neighborhood': neighborhood,
      'uf': uf,
    };
  }
}
