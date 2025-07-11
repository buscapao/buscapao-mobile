class City {
  final int? cityID;
  final String? name;
  final String? state;
  final String? zipCode;
  final String? ibgeCode;
  final String? street;
  final String? neighborhood;
  final String? uf;

  City({
    this.cityID,
    this.name,
    this.state,
    this.zipCode,
    this.ibgeCode,
    this.street,
    this.neighborhood,
    this.uf,
  });

  factory City.fromJson(Map<String?, dynamic> json) {
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

  Map<String?, dynamic> toJson() {
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
