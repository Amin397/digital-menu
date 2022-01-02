class ProductModel {
  ProductModel({
    this.id,
    this.contractorCategoryId,
    this.contractorSubcategoryId,
    this.productCategoryId,
    this.productsSubcategoryId,
    this.productsNameId,
    this.productName,
    this.ownName,
    this.image,
    this.contractorId,
    this.countUnitId,
    this.countUnitName,
    this.availableShiftId,
    this.price,
    this.makeReadyTime,
    this.minimumOrderCount,
    this.maximumOrderCount,
    this.contractorProductCategoryName,
    required this.count,
    this.detail,
    this.contractorProductCategoryId,
  });

  int? id;
  int count;
  int? contractorCategoryId;
  int? contractorSubcategoryId;
  int? productCategoryId;
  int? productsSubcategoryId;
  int? productsNameId;
  String? productName;
  String? ownName;
  String? detail;
  String? image;
  int? contractorId;
  int? countUnitId;
  String? countUnitName;
  List<String>? availableShiftId;
  String? price;
  String? makeReadyTime;
  String? minimumOrderCount;
  String? maximumOrderCount;
  String? contractorProductCategoryName;
  int? contractorProductCategoryId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    contractorCategoryId: json["contractor_category_id"],
    contractorSubcategoryId: json["contractor_subcategory_id"],
    productCategoryId: json["product_category_id"],
    productsSubcategoryId: json["products_subcategory_id"],
    productsNameId: json["products_name_id"],
    productName: json["product_name"],
    ownName: json["own_name"],
    image: json["image"],
    detail: json["detail"],
    contractorId: json["contractor_id"],
    countUnitId: json["count_unit_id"],
    countUnitName: json["count_unit_name"],
    availableShiftId: List<String>.from(json["available_shift_id"].map((x) => x)),
    price: json["price"],
    makeReadyTime: json["make_ready_time"],
    minimumOrderCount: json["minimum_order_count"],
    maximumOrderCount: json["maximum_order_count"],
    contractorProductCategoryName: json["contractor_product_category_name"],
    contractorProductCategoryId: json["contractor_product_category_id"],
    count: 0,
  );


  static List<ProductModel> listFromJson(List data)=>data.map((e) => ProductModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    "id": id,
    "contractor_category_id": contractorCategoryId,
    "contractor_subcategory_id": contractorSubcategoryId,
    "product_category_id": productCategoryId,
    "products_subcategory_id": productsSubcategoryId,
    "products_name_id": productsNameId,
    "product_name": productName,
    "own_name": ownName,
    "image": image,
    "contractor_id": contractorId,
    "count_unit_id": countUnitId,
    "count_unit_name": countUnitName,
    "available_shift_id": List<dynamic>.from(availableShiftId!.map((x) => x)),
    "price": price,
    "make_ready_time": makeReadyTime,
    "minimum_order_count": minimumOrderCount,
    "maximum_order_count": maximumOrderCount,
    "contractor_product_category_name": contractorProductCategoryName,
    "contractor_product_category_id": contractorProductCategoryId,
  };
}
