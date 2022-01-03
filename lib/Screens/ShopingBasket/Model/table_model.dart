class TableModel {
  TableModel({
    this.contractor,
    this.id,
    this.name,
    this.capacity,
    this.number,
    this.detail,
  });

  String? contractor;
  int? id;
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
  );

  Map<String, dynamic> toJson() => {
    "contractor": contractor,
    "id": id,
    "name": name,
    "capacity": capacity,
    "number": number,
    "detail": detail,
  };
}
