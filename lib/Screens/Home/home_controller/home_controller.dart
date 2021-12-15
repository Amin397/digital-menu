import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/HomeModel/home_model.dart';

class HomeController extends GetxController {
  var whichPage = Get.arguments;

  void onInit() {
    initialArguments();
    super.onInit();
  }

  initialArguments() {


    if (whichPage == 1) {
      whichPage = 1;
    } else if (whichPage == 2) {
      whichPage = 2;
    } else if (whichPage == 3) {
      whichPage = 3;
    }
  }

  nextPage() {
    if (whichPage == 1) {
      Get.toNamed('single', arguments: 1);
    } else if (whichPage == 2) {
      Get.toNamed(
        '/single',
        arguments: 2,
      );
      print("DONE 2");
    } else if (whichPage == 3) {
      print("ok");

      Get.toNamed(
        '/single',
        arguments: 3,
      );
      print("DONE 3");
    }
  }

  List<CardsModel> cardsList = [
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
    CardsModel(
      iconTitle: "assets/images/غذای اصلی.svg",
    ),
  ];
}
