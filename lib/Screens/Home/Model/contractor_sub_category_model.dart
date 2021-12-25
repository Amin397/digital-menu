class ContractorSubCategoryModel {
  ContractorSubCategoryModel({
    this.id,
    this.name,
    this.productCount,
    this.image,
  });

  String? id;
  String? name;
  int? productCount;
  String? image;

  factory ContractorSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      ContractorSubCategoryModel(
        id: json["id"],
        name: json["name"],
        productCount: json["product_count"],
        image: json["image"],
      );

  static List<ContractorSubCategoryModel> listFromJson(List data) =>
      data.map((e) => ContractorSubCategoryModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_count": productCount,
        "image": image,
      };
}
