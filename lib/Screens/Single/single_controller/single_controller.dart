import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/Screens/Home/HomeModel/home_model.dart';

class SingleController extends GetxController {


  var whichPage = Get.arguments;


  bool? CountBox = false;


  int number = 1;

  makeCountBox() {
    CountBox = !CountBox!;
    update();
  }

  plusNumber() {
    number++;
    update();
  }

  negetiveNumber() {
    number--;
    if (number == 0) {
      CountBox = false;
    }
    update();
  }



  void onInit() {
    initialArguments();
    super.onInit();
  }

  initialArguments() {
    print(whichPage.toString());
    if (whichPage == 1) {
      whichPage = 1;
    }else if(whichPage == 2){
      whichPage = 2;
    }else if(whichPage == 3){
      whichPage = 3;
    }

    pageController = PageController(viewportFraction: 1/4,initialPage: currentPage );

  }



  List<SingleProductModel> productList = [];

  int currentPage = 3;
  PageController? pageController;

  void changePage(page) {
    currentPage = page;

    update();
  }

  List<CardsModel> cardsList = [
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
      isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/DessertPhoto.svg",
        isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: false
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: true
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
        isSelected: false
    ),

  ];

  List<SingleProductModel> singleList = [
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/DessertPhoto.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
    SingleProductModel(
      iconTitle: "assets/images/غذای اصلی.svg", count: 1,
    ),
  ];

}
