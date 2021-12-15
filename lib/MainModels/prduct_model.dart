

class SingleProductModel {
  SingleProductModel({
    this.id,
    this.name,
    this.unit,
    this.productView,
    this.categoryId,
    this.categoryName,
    this.cityId,
    this.price,
    this.image,
    this.iconTitle,
    this.maximum,
    this.detail,
    required this.count,
    this.factor,
    this.isWishList
  });

  int? id;
  int count;
  String? name;
  String? unit;
  int? productView;
  int? categoryId;
  String? categoryName;
  int? cityId;
  String? price;
  String? iconTitle;
  String? image;
  String? maximum;
  dynamic detail;
  String? factor;
  bool? isWishList;

  // factory SingleProductModel.fromJson(Map<String, dynamic> json) => SingleProductModel(
  //   id: json["id"],
  //   name: json["name"],
  //   unit: json["unit"],
  //   productView: json["productView"],
  //   categoryId: json["categoryId"],
  //   categoryName: json["categoryName"],
  //   cityId: json["cityId"],
  //   price: json["price"],
  //   image: json["image"],
  //   maximum: json["maximum"],
  //   detail: json["detail"],
  //   factor: json["factor"],
  //     isWishList: json["isWishList"],
  //   count: 0
  // );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "unit": unit,
  //   "productView": productView,
  //   "categoryId": categoryId,
  //   "categoryName": categoryName,
  //   "cityId": cityId,
  //   "price": price,
  //   "image": image,
  //   "maximum": maximum,
  //   "detail": detail,
  //   "factor": factor,
  //   "isWishList": isWishList,
  // };
}
