class VarejoCreateModel {
  final String? id;
  final String name;
  final String legalName;
  final String document;
  final String email;
  final String phone;
  final String registration;
  final String satatus;
  final String retailType;
  final String url;

  VarejoCreateModel({
    this.id,
    required this.name,
    required this.legalName,
    required this.document,
    required this.email,
    required this.phone,
    required this.registration,
    required this.satatus,
    required this.retailType,
    required this.url,
  });
}
