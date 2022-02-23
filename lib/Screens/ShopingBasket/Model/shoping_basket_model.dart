import 'package:get/get.dart';

class TableModel {
  TableModel({
    this.contractor,
    this.id,
    this.name,
    this.capacity,
    this.number,
    this.detail,
    this.price,
    required this.isSelected,
  });

  String? contractor;
  int? id;
  RxBool isSelected = false.obs;
  int? price;
  String? name;
  int? capacity;
  int? number;
  String? detail;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    contractor: json["contractor"],
    id: json["id"],
    name: json["name"],
    capacity: json["capacity"],
    number: json["number"],
    detail: json["detail"],
    price: json["price"],
    isSelected: false.obs,
  );


  static List<TableModel> listFromJson(List data)=>data.map((e) => TableModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    "contractor": contractor,
    "id": id,
    "name": name,
    "capacity": capacity,
    "number": number,
    "detail": detail,
    "price": price,
  };
}
