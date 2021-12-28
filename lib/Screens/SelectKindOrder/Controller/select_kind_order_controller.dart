import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/SelectKindOrder/Model/restaurant_model.dart';

class SelectKindOrderController extends GetxController {
  bool? hasLogin;


  pressInSideOrder() async {

    hasLogin = false;
    if (hasLogin == false) {
      Blocs.shop.selectPageNumber(1);
      Get.toNamed('/home');
    }
  }

  pressOutSideOrder() async {
    hasLogin = true;
    if (hasLogin == true) {
      Get.toNamed('/loginscreen', arguments: 2);
    }
  }

  pressInSideReserveTableOrder() async {
    hasLogin = true;
    if (hasLogin == true) {
      Get.toNamed('/loginscreen', arguments: 3);
    }
  }

  @override
  void onInit() {
    //
    // print('==============');
    // print(window.location.href.split('/').last);
    // print('==============');
    getRestaurantData();
    super.onInit();
  }

  void getRestaurantData() async {
    RequestHelper.makePostRequest(
      controller: 'Contractors',
      method: 'singleContractor',
      body: {
        'contractorUrlAddress': '79f7d8ba1f2e747286c5e4cb1cdd9eb4'
      }
    ).then((value) {
      if(value.isDone){

        Blocs.shop.getData(value.data);
      }else{
        ViewHelper.errorSnackBar(message: 'خطایی رخ داد');
      }

      update();
    });
  }
}
