import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Screens/RegisterScreen/RegisterModel/register_model.dart';

class RegisterController extends GetxController {
  var whichPage = Get.arguments;

  TextEditingController nameTextfieldController = TextEditingController();
  TextEditingController passWordTextfieldController = TextEditingController();

  List<GenderApiResult> gendersList = [
    GenderApiResult(genderId: 1, genderName: 'مرد', isGender: false),
    GenderApiResult(genderId: 2, genderName: 'زن', isGender: false),
  ];

  @override
  void onInit() {
    initialArguments();
    pageViewController = PageController(initialPage: 0);
    super.onInit();
  }

  initialArguments() {
    print(whichPage["outSideOrderArgument"].toString());
    print(whichPage["reserveTableArgument"].toString());

    if (whichPage == ["outSideOrderArgument"]) {
      whichPage = ["outSideOrderArgument"];
    } else if (whichPage == ["reserveTableArgument"]) {
      whichPage = ["reserveTableArgument"];
    }
  }

  PageController? pageViewController;
  bool isfemaleOn = false;
  bool ismaleOn = false;

  GenderSelected(index) {
    for (var o in gendersList) {
      o.isGender = false;
    }
    gendersList[index].isGender = true;
    gendersList[index].genderId;
    gendersList[index].genderName;

    update();
  }

  getCompeleteRegister() async {
    print(gendersList.singleWhere((element) => element.isGender!).genderId);
    print("A");
    http.Response mehdi = await http.post(
        Uri.parse(
            "https://rest.negaapps.ir/admin/Customers/API/_register?token=test"),
        body: {
          "mobile": whichPage["mobileTextfieldController"],
          "name": nameTextfieldController.text,
          "password": passWordTextfieldController.text,
          "gender": gendersList
              .singleWhere((element) => element.isGender!)
              .genderId
              .toString(),
        });
    print("B");
    Map<String, dynamic> result = jsonDecode(mehdi.body);
    String nameTextToSendBack = nameTextfieldController.text;
    String passWordTextToSendBack = passWordTextfieldController.text;
    print(nameTextToSendBack);
    print(passWordTextToSendBack);

    if (result["isDone"] == true

        //     whichPage == ["outSideOrderArgument"] ||
        // whichPage == ["reserveTableArgument"]
        ) {
      if (nameTextToSendBack.isNotEmpty) {
        if (passWordTextToSendBack.isNotEmpty) {
          if (whichPage["outSideOrderArgument"] == 2) {
            print("ok");
            print(result["isDone"].toString());
            Get.toNamed(
              '/home',
              arguments: 2
            );
            print("DONE 2");
          } else if (whichPage["reserveTableArgument"] == 3) {
            print("ok");
            print(result["isDone"].toString());
            Get.toNamed(
              '/reservetable',
              arguments: 3
            );
            print("DONE 3");
          } else {
            print("whichPage is not work");
          }
          // print("DONE");
        } else {
          print("passWordTextToSendBack.isEmpty");
        }
        // print("DONE");
      } else {
        print("nameTextToSendBack.isEmpty");
      }
      // print("DONE");
    } else {
      print("isDone Is not true");
    }
  }
}
