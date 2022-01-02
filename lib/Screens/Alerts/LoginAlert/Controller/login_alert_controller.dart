import 'package:get/get.dart';

class LoginAlertController extends GetxController {
  double dividerHeight = 0.0;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 100), () {
      dividerHeight = Get.width;
      update();
    });
    super.onInit();
  }
}
