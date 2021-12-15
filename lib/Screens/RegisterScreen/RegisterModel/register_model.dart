class RegisterApiResult {
  RegisterApiResult({
    this.isDone,
    this.requestedMethod,
    this.data,
  });

  bool? isDone;
  String? requestedMethod;
  String? data;

  factory RegisterApiResult.fromJson(Map<String, dynamic> json) => RegisterApiResult(
    isDone: json["isDone"],
    requestedMethod: json["requestedMethod"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "isDone": isDone,
    "requestedMethod": requestedMethod,
    "data": data,
  };
}





class GenderApiResult {
  GenderApiResult({
    this.isGender,
    this.genderName,
    this.genderId,
  });

  bool? isGender;
  String? genderName;
  int? genderId;

  // factory GenderApiResult.fromJson(Map<String, dynamic> json) => GenderApiResult(
  //   isGender: json["isGender"],
  //   genderName: json["genderName"],
  //   genderId: json["genderId"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "isGender": isGender,
  //   "genderName": genderName,
  //   "genderId": genderId,
  // };
}