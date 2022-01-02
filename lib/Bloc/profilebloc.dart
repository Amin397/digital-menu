import 'dart:async';

import 'package:untitled13/MainModels/user_model.dart';

class User {
  final streamController = StreamController.broadcast();

  Stream get getStream => streamController.stream;


  UserModel? user;

  void setData({Map<String, dynamic>? json}) {
    user = UserModel.fromJson(json!);
    streamController.sink.add(user);
  }

  // void sync() {
  //   streamController.sink.add(userProfileModel);
  // }
}


