class GetAllBranches {
  final int limit;
  final int page;
  final int totalRows;
  final int totalPages;
  final List<Branch> items;

  GetAllBranches({
    required this.limit,
    required this.page,
    required this.totalRows,
    required this.totalPages,
    required this.items,
  });

  factory GetAllBranches.fromJson(Map<String, dynamic> json) {
    return GetAllBranches(
      limit: json['limit'] ?? 0,
      page: json['page'] ?? 0,
      totalRows: json['totalRows'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((item) => Branch.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'page': page,
      'totalRows': totalRows,
      'totalPages': totalPages,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Branch {
  final int retailID;
  final int? retailFatherID;
  final String name;
  final String? legalName;
  final String document;
  final String email;
  final String phone;
  final String? stateRegistration;
  final String status;
  final String retailType;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  Branch({
    required this.retailID,
    this.retailFatherID,
    required this.name,
    this.legalName,
    required this.document,
    required this.email,
    required this.phone,
    this.stateRegistration,
    required this.status,
    required this.retailType,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      retailID: json['retailID'] ?? 0,
      retailFatherID: json['retailFatherID'],
      name: json['name'] ?? '',
      legalName: json['legalName'],
      document: json['document'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      stateRegistration: json['stateRegistration'],
      status: json['status'] ?? '',
      retailType: json['retailType'] ?? '',
      url: json['url'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'retailID': retailID,
      'retailFatherID': retailFatherID,
      'name': name,
      'legalName': legalName,
      'document': document,
      'email': email,
      'phone': phone,
      'stateRegistration': stateRegistration,
      'status': status,
      'retailType': retailType,
      'url': url,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
