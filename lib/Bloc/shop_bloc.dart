import 'dart:async';

import 'package:untitled13/Screens/SelectKindOrder/Model/restaurant_model.dart';

class Shop{

  RestaurantModel? shopModel;

  final streamController = StreamController.broadcast();

  int whichPage = 0;
  Stream get getStream => streamController.stream;



  getData(dynamic value){
    shopModel = RestaurantModel.fromJson(value);
    sync();
  }


  sync(){
    streamController.sink.add(shopModel);
  }

  void selectPageNumber(int i) {
    whichPage = i;
    sync();
  }


}