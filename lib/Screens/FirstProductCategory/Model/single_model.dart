class ProductCategoryModel {
  ProductCategoryModel({
    this.parentId,
    this.id,
    this.name,
    this.detail,
    this.icon,
    this.isSelected,
  });

  int? parentId;
  int? id;
  String? name;
  String? detail;
  double position = 0;
  String? icon;
  bool? isSelected;



  static List<ProductCategoryModel> listFromJson(List data)=>data.map((e) => ProductCategoryModel.fromJson(e)).toList();

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
    parentId: json["parent_id"],
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
    icon: json["icon"],
    isSelected: false,
  );

  Map<String, dynamic> toJson() => {
    "parent_id": parentId,
    "id": id,
    "name": name,
    "detail": detail,
    "icon": icon,
  };
}
