class UserModel {
  UserModel({
    this.id,
    this.name,
    this.gender,
    this.mobile,
  });

  int? id;
  String? name;
  int? gender;
  String? mobile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "mobile": mobile,
  };
}
