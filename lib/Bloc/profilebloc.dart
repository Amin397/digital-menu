// import 'dart:async';
//
// class ProfileBloc {
//   final streamController = StreamController.broadcast();
//
//   Stream get getStream => streamController.stream;
//
//
//   UserProfileModel? userProfileModel;
//
//   void setData({Map<String, dynamic>? json}) {
//     userProfileModel = UserProfileModel.fromJson(json!);
//     streamController.sink.add(userProfileModel);
//   }
//
//   void sync() {
//     streamController.sink.add(userProfileModel);
//   }
// }
//
//
