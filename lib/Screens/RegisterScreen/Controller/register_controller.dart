import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/MainModels/api_result.dart';
import 'package:untitled13/Screens/RegisterScreen/Model/register_model.dart';

class RegisterController extends GetxController {
  var whichPage = Get.arguments;

  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController passWordTextFieldController = TextEditingController();

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
        passWordTextFieldController.text.length == 8) {
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
          }).then((value) async {
        await EasyLoading.show(
          status: 'در حال پردازش ...',
          maskType: EasyLoadingMaskType.black,
        );
        Future.delayed(const Duration(seconds: 2), () async {
          EasyLoading.dismiss();
        });
        if (value.isDone) {
          if (whichPage["outSideOrderArgument"] == 2) {
            Future.delayed(const Duration(seconds: 2), () async {
              Get.offNamed('/home', arguments: 2);
            });

            print("DONE 2");
          } else if (whichPage["reserveTableArgument"] == 3) {
            Future.delayed(const Duration(seconds: 2), () async {
              Get.offNamed('/reservetable', arguments: 3);
            });
            print("DONE 3");
          }
        }
      });
    } else {
      //TODO:inja error neshon bede
    }
  }

  static var customerInfoSaved = GetStorage();

  CustomerInfoModel? customerInfoModel;

  getCustomerInfo() async {
    RequestHelper.makePostRequest(
        controller: 'Customers',
        method: 'customerInfo',
        body: {"mobile": whichPage["mobileTextfieldController"]}).then(
      (value) async {
        print(value.data);
        await EasyLoading.show(
          status: 'در حال پردازش ...',
          maskType: EasyLoadingMaskType.black,
        );
        Future.delayed(const Duration(seconds: 2), () async {
          EasyLoading.dismiss();
        });
        if (value.isDone) {
          for (var o in value.data) {
            customerInfoModel = CustomerInfoModel.fromJson(o);
          }
          customerInfoSaved.write("globalUserNumberSaved", customerInfoModel);
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
