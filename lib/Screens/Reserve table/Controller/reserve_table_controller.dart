import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';

class ReserveTableController extends GetxController {
  var whichPage = Get.arguments;

  int currentPage = 3;
  PageController? pageController;

  void changePage(page) {
    currentPage = page;

    update();
  }

  @override
  void onInit() {
    initialArguments();
    pageController =
        PageController(viewportFraction: 1 / 5, initialPage: currentPage);
    super.onInit();
  }

  initialArguments() {
    print(whichPage.toString());
    if (whichPage == 3) {
      whichPage = 3;
    }
  }

  List<SingleProductModel> basketList = [
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
    SingleProductModel(
      count: 1,
      name: "چلوکباب نگینی",
      price: "تومان 150000",
    ),
  ];

  List<TableModel> selectTableList = [
    TableModel(
      count: "1",
    ),
    TableModel(
      count: "2",
    ),
    TableModel(
      count: "3",
    ),
    TableModel(
      count: "4",
    ),
    TableModel(
      count: "5",
    ),
    TableModel(
      count: "6",
    ),
    TableModel(
      count: "7",
    ),
    TableModel(
      count: "8",
    ),
    TableModel(
      count: "9",
    ),
    TableModel(
      count: "10",
    ),
    TableModel(
      count: "11",
    ),
  ];
}
