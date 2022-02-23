import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:untitled13/MainModels/get_routs.dart';

class SplashController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    checkDevice();
    super.onInit();
  }

  void checkDevice() {
    if(kIsWeb){
      Get.offAndToNamed(NameRouts.selectKindOrderScreen);
    }else{
      Future.delayed(const Duration(milliseconds: 1000) , (){
        Get.offAndToNamed(NameRouts.selectKindOrderScreen);
      });
    }
  }
}