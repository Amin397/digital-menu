class RestaurantModel {
  RestaurantModel({
    this.id,
    this.brandName,
    this.categoryId,
    this.subCategories,
    this.stateId,
    this.cityId,
    this.districtIds,
    this.telephone,
    this.latitude,
    this.longitude,
    this.urLaddress,
    this.orderInResturant,
    this.orderWithDelivery,
    this.tableReservation,
    this.logo,
    this.image,
    this.reservationTime,
    this.hasGateway,
    this.cashback,
  });

  int? id;
  String? brandName;
  String? categoryId;
  List<String>? subCategories;
  String? stateId;
  String? cityId;
  List<String>? districtIds;
  String? telephone;
  String? latitude;
  String? longitude;
  String? urLaddress;
  int? orderInResturant;
  int? orderWithDelivery;
  int? tableReservation;
  String? logo;
  String? image;
  int? reservationTime;
  int? hasGateway;
  int? cashback;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    id: json["id"],
    brandName: json["brandName"],
    categoryId: json["categoryId"],
    subCategories: List<String>.from(json["subCategories"].map((x) => x)),
    stateId: json["stateId"],
    cityId: json["cityId"],
    districtIds: List<String>.from(json["districtIds"].map((x) => x)),
    telephone: json["telephone"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    urLaddress: json["URLaddress"],
    orderInResturant: json["orderInResturant"],
    orderWithDelivery: json["orderWithDelivery"],
    tableReservation: json["tableReservation"],
    logo: json["logo"],
    image: json["image"],
    reservationTime: json["reservation_time"],
    hasGateway: json["hasGateway"],
    cashback: json["cashback"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brandName": brandName,
    "categoryId": categoryId,
    "subCategories": List<dynamic>.from(subCategories!.map((x) => x)),
    "stateId": stateId,
    "cityId": cityId,
    "districtIds": List<dynamic>.from(districtIds!.map((x) => x)),
    "telephone": telephone,
    "latitude": latitude,
    "longitude": longitude,
    "URLaddress": urLaddress,
    "orderInResturant": orderInResturant,
    "orderWithDelivery": orderWithDelivery,
    "tableReservation": tableReservation,
    "logo": logo,
    "image": image,
    "reservation_time": reservationTime,
    "hasGateway": hasGateway,
    "cashback": cashback,
  };
}
