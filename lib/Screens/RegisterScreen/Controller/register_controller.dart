import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/api_result.dart';
import 'package:untitled13/MainModels/user_model.dart';
import 'package:untitled13/Screens/RegisterScreen/Model/register_model.dart';

class RegisterController extends GetxController {
  var whichPage = Get.arguments;

  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController passWordTextFieldController = TextEditingController();
  String? mobile;


  List<GenderApiResult> gendersList = [
    GenderApiResult(
      genderId: 1,
      genderName: 'مرد',
      isGender: false,
    ),
    GenderApiResult(
      genderId: 2,
      genderName: 'زن',
      isGender: false,
    ),
  ];



  @override
  void onInit() {
    mobile = whichPage["mobileTextfieldController"];
    initialArguments();
    pageViewController = PageController(initialPage: 0);
    super.onInit();
  }

  initialArguments() {
    if (whichPage == ["outSideOrderArgument"]) {
      whichPage = ["outSideOrderArgument"];
    } else if (whichPage == ["reserveTableArgument"]) {
      whichPage = ["reserveTableArgument"];
    }
  }

  PageController? pageViewController;
  bool isFemaleOn = false;
  bool isMaleOn = false;

  genderSelected(index) async {
    for (var o in gendersList) {
      o.isGender = false;
    }
    gendersList[index].isGender = true;
    gendersList[index].genderId;
    gendersList[index].genderName;

    update();
  }

  getCompeleteRegister() async {
    if (passWordTextFieldController.text.isNotEmpty &&
        passWordTextFieldController.text.length >= 6) {
      await EasyLoading.show(
        status: 'در حال پردازش ...',
        maskType: EasyLoadingMaskType.black,
      );

      RequestHelper.makePostRequest(
          controller: 'Customers',
          method: 'register',
          body: {
            "mobile": whichPage["mobileTextfieldController"],
            "name": nameTextFieldController.text,
            "password": passWordTextFieldController.text,
            "gender": gendersList
                .singleWhere((element) => element.isGender!)
                .genderId
                .toString(),
          }).then(
        (value) async {
          EasyLoading.dismiss();
          if (value.isDone) {
            getCustomerInfo();
          } else {
            ViewHelper.errorSnackBar(
              message: 'کد ارسالی اشتباه است',
            );
          }
        },
      );
    } else {
      ViewHelper.errorSnackBar(
        message: 'رمز عبور شما باید بیشتر از 6 حرف باشد',
      );
    }
  }

  static var customerInfoSaved = GetStorage();
  UserModel? customerInfoModel;

  getCustomerInfo() async {
    await EasyLoading.show(
      status: 'در حال پردازش ...',
      maskType: EasyLoadingMaskType.black,
    );
    RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'customerInfo',
        body: {
          "mobile": whichPage["mobileTextfieldController"],
        }).then(
      (value) async {
        EasyLoading.dismiss();
        if (value.isDone) {
          customerInfoModel = UserModel.fromJson(
            value.data,
          );

          Blocs.user.setData(
            json: value.data,
          );
          customerInfoSaved.write(
              "userMobile", whichPage["mobileTextfieldController"].toString());
          if (whichPage["outSideOrderArgument"] == 2) {
            Get.offNamed('/selectkindorder', arguments: 2);
          } else if (whichPage["reserveTableArgument"] == 3) {
            Get.offNamed(
              '/selectkindorder',
            );
          }
        }
      },
    );
  }

// getCompeleteRegister2() async {
//   print(gendersList.singleWhere((element) => element.isGender!).genderId);
//   print("A");
//   http.Response mehdi = await http.post(
//       Uri.parse(
//           "https://rest.negaapps.ir/admin/Customers/API/_register?token=test"),
//       body: {
//         "mobile": whichPage["mobileTextfieldController"],
//         "name": nameTextfieldController.text,
//         "password": passWordTextfieldController.text,
//         "gender": gendersList
//             .singleWhere((element) => element.isGender!)
//             .genderId
//             .toString(),
//       });
//   print("B");
//   Map<String, dynamic> result = jsonDecode(mehdi.body);
//   String nameTextToSendBack = nameTextfieldController.text;
//   String passWordTextToSendBack = passWordTextfieldController.text;
//   print(nameTextToSendBack);
//   print(passWordTextToSendBack);
//
//   if (result["isDone"] == true
//
//       //     whichPage == ["outSideOrderArgument"] ||
//       // whichPage == ["reserveTableArgument"]
//       ) {
//     if (nameTextToSendBack.isNotEmpty) {
//       if (passWordTextToSendBack.isNotEmpty) {
//         if (whichPage["outSideOrderArgument"] == 2) {
//           print("ok");
//           print(result["isDone"].toString());
//           Get.toNamed('/home', arguments: 2);
//           print("DONE 2");
//         } else if (whichPage["reserveTableArgument"] == 3) {
//           print("ok");
//           print(result["isDone"].toString());
//           Get.toNamed('/reservetable', arguments: 3);
//           print("DONE 3");
//         } else {
//           print("whichPage is not work");
//         }
//         // print("DONE");
//       } else {
//         print("passWordTextToSendBack.isEmpty");
//       }
//       // print("DONE");
//     } else {
//       print("nameTextToSendBack.isEmpty");
//     }
//     // print("DONE");
//   } else {
//     print("isDone Is not true");
//   }
// }

}
