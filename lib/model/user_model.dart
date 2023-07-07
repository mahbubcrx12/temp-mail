class UserModel {
  String? context;
  String? id;
  String? type;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.context,
    this.id,
    this.type,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      context: json['@context'],
      id: json['@id'],
      type: json['@type'],
      address: json['address'],
      quota: json['quota'],
      used: json['used'],
      isDisabled: json['isDisabled'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
