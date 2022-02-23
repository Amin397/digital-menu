import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/get_routs.dart';

class LoginController extends GetxController {
  TextEditingController mobileTextfieldController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  var whichPage = Get.arguments;

  PageController? pageViewController;

  @override
  void onInit() {
    pageViewController = PageController(initialPage: 0);
    super.onInit();
  }


  goToFirstPage(){
    pageViewController!.jumpTo(0);
  }

  getLoginAPI() async {
    if (mobileTextfieldController.text.isNotEmpty &&
        mobileTextfieldController.text.length == 11) {
      await EasyLoading.show(
        status: 'در حال پردازش ...',
        maskType: EasyLoadingMaskType.black,
      );
      await RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'startLR',
        body: {
          "customer_mobile": mobileTextfieldController.text,
        },
      ).then(
        (value) {
          EasyLoading.dismiss();
          if (value.isDone) {
            if (value.data['isRegistered'] == 0) {
              pageViewController!.jumpToPage(2);
            } else {
              pageViewController!.jumpToPage(1);
            }
          }
        },
      );
    }
  }

  getPinCodeAPI() async {
    if (mobileTextfieldController.text.isNotEmpty &&
        mobileTextfieldController.text.length == 11) {
      EasyLoading.show(
        status: 'در حال پردازش ...',
        maskType: EasyLoadingMaskType.black,
      );

      await RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'codeValidate',
        body: {
          "mobile": mobileTextfieldController.text,
          "code": pinCodeController.text,
        },
      ).then(
        (value) {
          EasyLoading.dismiss();
          if (value.isDone) {
            if (whichPage == 2) {
              Get.toNamed(
                '/registerScreen',
                arguments: {
                  "outSideOrderArgument": 2,
                  "mobileTextfieldController": mobileTextfieldController.text
                },
              );
            }
            if (whichPage == 3) {
              Get.toNamed(
                '/registerScreen',
                arguments: {
                  "reserveTableArgument": 3,
                  "mobileTextfieldController": mobileTextfieldController.text
                },
              );
            }
          } else {
            ViewHelper.errorSnackBar(
              message: 'کد ارسالی اشتباه است',
            );
          }
        },
      );
    }
  }

  sendAgainGetPinCodeAPI() async {
    EasyLoading.show(
      status: 'در حال پردازش ...',
      maskType: EasyLoadingMaskType.black,
    );
    RequestHelper.makePostRequest(
      controller: 'Customers',
      method: 'startLR',
      body: {
        "customer_mobile": mobileTextfieldController.text,
      },
    ).then(
      (value) {
        EasyLoading.dismiss();
        if (value.isDone) {
          pageViewController!.jumpToPage(3);
        } else {
          ViewHelper.errorSnackBar(
            message: 'کد ارسالی اشتباه است',
          );
        }
      },
    );
  }

  getPassWordAPI() async {
    final box = GetStorage();
    if (passWordController.text.isNotEmpty &&
        passWordController.text.length >= 6) {
      await EasyLoading.show(
        status: 'در حال پردازش ...',
        maskType: EasyLoadingMaskType.black,
      );
      RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'login',
        body: {
          "mobile": mobileTextfieldController.text,
          "password": passWordController.text,
        },
      ).then(
        (value) {
          EasyLoading.dismiss();
          if (value.isDone) {
            box.write(
              'userMobile',
              mobileTextfieldController.text,
            );
            Blocs.user.setData(
              json: value.data['data'],
            );
            getUserData();
          }
        },
      );
    } else {
      ViewHelper.errorSnackBar(
        message: 'رمز عبور شما باید حداقل 6 حرف باشد',
      );
    }
  }

  getUserData() async {
      RequestHelper.makePostRequest(
        body: {
          'mobile': mobileTextfieldController.text,
        },
        controller: 'Customers',
        method: 'customerInfo',
      ).then(
            (value) {
          if (value.isDone) {
            Blocs.user.setData(
              json: value.data,
            );
            Get.offNamed(
              NameRouts.selectKindOrderScreen,
              arguments: 2,
            );
          }
        },
      );
  }


}
