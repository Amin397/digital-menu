
import 'dart:convert';

class LoginApiResult {
  LoginApiResult({
    this.isDone,
    this.requestedMethod,
    this.message,
  });

  bool? isDone;
  String? requestedMethod;
  dynamic? message;

  factory LoginApiResult.fromJson(Map<String, dynamic> json) => LoginApiResult(
    isDone: json["isDone"],
    requestedMethod: json["requestedMethod"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "isDone": isDone,
    "requestedMethod": requestedMethod,
    "message": message,
  };
}

class PinCodeApiResult {
  PinCodeApiResult({
    this.isDone,
    this.requestedMethod,
    this.data,
  });

  bool? isDone;
  String? requestedMethod;
  String? data;

  factory PinCodeApiResult.fromJson(Map<String, dynamic> json) => PinCodeApiResult(
    isDone: json["isDone"],
    requestedMethod: json["requestedMethod"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "isDone": isDone,
    "requestedMethod": requestedMethod,
    "data": data,
  };


  static List<PinCodeApiResult> listFromJson(List data) => data.map((e) => PinCodeApiResult.fromJson(e)).toList();

}




class PassWordApiResult {
  PassWordApiResult({
    this.isDone,
    this.requestedMethod,
    this.data,
  });

  bool? isDone;
  String? requestedMethod;
  String? data;

  factory PassWordApiResult.fromJson(Map<String, dynamic> json) => PassWordApiResult(
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