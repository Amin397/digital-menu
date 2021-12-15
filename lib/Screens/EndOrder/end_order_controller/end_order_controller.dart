import 'package:get/get.dart';

class EndOrderController extends GetxController {

  var whichPage = Get.arguments;


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
  }


}
