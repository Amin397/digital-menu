class UserModel {
  UserModel({
    this.customerId,
    this.name,
    this.customerGender,
    this.customerAvatar,
  });

  int? customerId;
  String? name;
  int? customerGender;
  String? customerAvatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    customerId: json["customerId"],
    name: json["name"],
    customerGender: json["customerGender"],
    customerAvatar: json["customerAvatar"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "name": name,
    "customerGender": customerGender,
    "customerAvatar": customerAvatar,
  };
}
