import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Model/home_model.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';
import 'package:untitled13/Screens/SelectKindOrder/Model/restaurant_model.dart';

class HomeController extends GetxController {

  int? whichPage;
  RestaurantModel? model;

  @override
  void onInit() {
    whichPage = Get.arguments['id'];
    model = Get.arguments['model'];
    initialArguments();
    RegisterController.customerInfoSaved.read("globalUserNumberSaved");
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
    } else if (whichPage == 3) {

      Get.toNamed(
        '/single',
        arguments: 3,
      );
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
