import 'package:get/get.dart';

class SelectKindOrderController extends GetxController {
  bool? hasLogin;


  pressInSideOrder() {
    hasLogin = false;
    if (hasLogin == false) {
      Get.toNamed('/home', arguments: 1);
    }
  }


  pressOutSideOrder() {
    hasLogin = true;
    if (hasLogin == true) {
      Get.toNamed('/loginscreen', arguments: 2);
    }
  }


  pressInSideReserveTableOrder() {
    hasLogin = true;
    if (hasLogin == true) {
      Get.toNamed('/loginscreen', arguments: 3);
    }
  }


}
