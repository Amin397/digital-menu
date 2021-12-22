class ApiResult {
  bool isDone;
  String requestedMethod;
  dynamic data;

  ApiResult(this.isDone, this.requestedMethod, this.data);

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        json['isDone'],
        json['requestedMethod'],
        json['data'],
      );
}


class CustomerInfoModel {
  CustomerInfoModel({
    required this.customerId,
    required this.name,
    required this.customerGender,
    required this.customerAvatar,
  });

  int customerId;
  String name;
  int customerGender;
  String customerAvatar;

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) => CustomerInfoModel(
    customerId: json["customerId"],
    name: json["name"],
    customerGender: json["customerGender"],
    customerAvatar: json["customerAvatar"],
  );

}