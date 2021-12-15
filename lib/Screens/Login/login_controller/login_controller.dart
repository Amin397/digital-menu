import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Screens/Login/LoginModel/login_model.dart';

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
    print("A");
    http.Response mehdi = await http.post(
        Uri.parse(
            "https://rest.negaapps.ir/admin/Customers/API/_startLR?token=test"),
        body: {"customer_mobile": mobileTextfieldController.text});

    print("B");
    Map<String, dynamic> result = jsonDecode(mehdi.body);
    if (result["isDone"] == true) {
      // print("SMS is not send ");
      LoginApiResult m = LoginApiResult.fromJson(result["data"]);

      String textToSendBack = mobileTextfieldController.text;
      print(textToSendBack);
      if (result["isRegistered"] == 0 && textToSendBack.isNotEmpty) {
        print(textToSendBack);
        print("SMS is not send ");
        pageViewController!.jumpToPage(1);

        print("isRegister");
      } else {
        if (textToSendBack.isNotEmpty) {
          pageViewController!.jumpToPage(2);
          print("isNotRegister");
        }
      }
    }
  }

  getPinCodeAPI() async {
    print("A");
    http.Response mehdi = await http.post(
        Uri.parse(
            "https://rest.negaapps.ir/admin/Customers/API/_codeValidate?token=test"),
        body: {
          "mobile": mobileTextfieldController.text,
          "code": pinCodeController.text,
        });
    print("B");
    Map<String, dynamic> result = jsonDecode(mehdi.body);
    if (result["isDone"] == true) {
      print("ok");
      print(result["isDone"].toString());

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

      // print("DONE");
    } else {
      print("isDone Is not true");
    }
  }

  sendAgainGetPinCodeAPI() async {
    print("A");
    http.Response mehdi = await http.post(
        Uri.parse(
            "https://rest.negaapps.ir/admin/Customers/API/_startLR?token=test"),
        body: {
          "customer_mobile": mobileTextfieldController.text,
        });
    print("B");
    print(mobileTextfieldController.text);
    Map<String, dynamic> result = jsonDecode(mehdi.body);
    if (result["isDone"]) {
      print("ok");
      print(mobileTextfieldController.text);
      print(result["isDone"].toString());

      print("کد تایید مجددا ارسال شد");

      // print("DONE");
    } else {
      print("isDone Is not true");
    }
  }

  getPassWordAPI() async {
    print("A");
    http.Response mehdi = await http.post(
        Uri.parse(
            "https://rest.negaapps.ir/admin/Customers/API/_login?token=test"),
        body: {
          "mobile": mobileTextfieldController.text,
          "password": passWordController.text,
        });
    print("B");
    Map<String, dynamic> result = jsonDecode(mehdi.body);
    if (result["isDone"] == true && whichPage == 2 || whichPage == 3) {
      print("ok");
      print(result["isDone"].toString());
      Get.toNamed(
        '/home',
        arguments: 2,
      );
      Get.toNamed('/reservetable', arguments: 3);

      // print("DONE");
    } else {
      print("isDone Is not true");
    }
  }
}
