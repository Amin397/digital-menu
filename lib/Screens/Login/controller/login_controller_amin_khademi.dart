import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Helpers/reuqest_helper.dart';

class LoginController extends GetxController {
  TextEditingController mobileTextfieldController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  var whichPage = Get.arguments;

  PageController? pageViewController;

  @override
  void onInit() {
    initialArguments();
    pageViewController = PageController(initialPage: 0);
    super.onInit();
  }


  initialArguments() {
    print(whichPage.toString());
    if (whichPage == 2) {
      whichPage = 2;
    } else if (whichPage == 3) {
      whichPage = 3;
    }
  }

  bool? isShowPass = false;

  showingPass() {
    isShowPass = !isShowPass!;
    print("object");
    update();
  }

  getLoginAPI() async {
    if (mobileTextfieldController.text.isNotEmpty &&
        mobileTextfieldController.text.length == 11) {

      print("getLoginAPI is click");
      await RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'startLR',
        body: {
          "customer_mobile": mobileTextfieldController.text,
        },
      ).then(
        (value) async{
          await EasyLoading.show(
            status: 'در حال پردازش ...',
            maskType: EasyLoadingMaskType.black,
          );
          Future.delayed(const Duration(seconds: 2), () async {
            EasyLoading.dismiss();
          });
          if (value.isDone) {
            if (value.data['isRegistered'] == 0) {
              print("getLoginAPI value.data['isRegistered'] == 0 is done");
              Future.delayed(const Duration(seconds: 2), () async {
                pageViewController!.jumpToPage(2);
              });

              print("jumpToPage(2) is done");
            } else {
              Future.delayed(const Duration(seconds: 2), () async {
                pageViewController!.jumpToPage(1);
              });

              print("jumpToPage(1) is done");
              print("value.data['isRegistered'] == 0 is not work");
            }
          } else {
            print("value.isDone is not work");
          }
        },
      );
    } else {

      print("درخواست کار نمیکنه");
    }
  }

  getPinCodeAPI() async {
    if (mobileTextfieldController.text.isNotEmpty &&
        mobileTextfieldController.text.length == 11) {

      print("getLoginAPI is click");
      await RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'codeValidate',
        body: {
          "mobile": mobileTextfieldController.text,
          "code": pinCodeController.text,
        },
      ).then(
        (value) async{
          await EasyLoading.show(
            status: 'در حال پردازش ...',
            maskType: EasyLoadingMaskType.black,
          );
          Future.delayed(const Duration(seconds: 2), () async {
            EasyLoading.dismiss();
          });
          if (value.isDone) {
            if (whichPage == 2) {
              Future.delayed(const Duration(seconds: 2), () async {
                Get.toNamed(
                  '/registerScreen',
                  arguments: {
                    "outSideOrderArgument": 2,
                    "mobileTextfieldController": mobileTextfieldController.text
                  },
                );
              });

            }

            if (whichPage == 3) {
              Future.delayed(const Duration(seconds: 2), () async {
                Get.toNamed(
                  '/registerScreen',
                  arguments: {
                    "reserveTableArgument": 3,
                    "mobileTextfieldController": mobileTextfieldController.text
                  },
                );
              });

            }
          } else {
            print("value.isDone is not work");
          }
        },
      );
    } else {
      //TODO:inja error neshon bede
      print("درخواست کار نمیکنه");
    }
  }



  sendAgainGetPinCodeAPI() async {

    RequestHelper.makePostRequest(
      controller: 'Customers',
      method: 'startLR',
      body: {
        "customer_mobile": mobileTextfieldController.text,
      },
    ).then(
      (value) async{
        await EasyLoading.show(
          status: 'در حال پردازش ...',
          maskType: EasyLoadingMaskType.black,
        );
        Future.delayed(const Duration(seconds: 2), () async {
          EasyLoading.dismiss();
        });
        value.isDone;
      },
    );
    print("اس ام اس مجددا ارسال شد");
  }



  getPassWordAPI() async {
    print("متد کار میکنه");
    if (passWordController.text.isNotEmpty &&
        passWordController.text.length == 8) {

      print("شرط کار میکنه");
      RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'login',
        body: {
          "mobile": mobileTextfieldController.text,
          "password": passWordController.text,
        },
      ).then(
        (value) async{
          await EasyLoading.show(
            status: 'در حال پردازش ...',
            maskType: EasyLoadingMaskType.black,
          );
          Future.delayed(const Duration(seconds: 2), () async {
            EasyLoading.dismiss();
          });
          if (value.isDone) {
            print("is done password is true");

            if (whichPage == 2) {
              Future.delayed(const Duration(seconds: 2), () async {
                Get.offNamed(
                  '/home',
                  arguments: 2,
                );
              });

            } else if (whichPage == 3) {
              Future.delayed(const Duration(seconds: 2), () async {
                Get.offNamed('/reservetable', arguments: 3);
              });

            }
          } else {
            //TODO:inja error neshon bede
            print("is done password is not true");
          }
        },
      );
    }
  }
}
