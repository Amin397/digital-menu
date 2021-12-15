import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Login/login_controller/login_controller.dart';

class MobileTextFieldLogin extends StatelessWidget {
  const MobileTextFieldLogin({Key? key, this.loginController})
      : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return mobileTextfield();
  }

  Widget mobileTextfield() {
    return Container(
      height: Get.height * .05,
      width: Get.width * .7,
      padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black.withOpacity(.2), width: 01),
        borderRadius: BorderRadius.circular(Get.height * .012),
      ),
      child: TextField(
        autofocus: false,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  - - -      - - -      - - -   98 +",
            hintStyle: TextStyle(color: Colors.grey)),
        style: TextStyle(
          color: Colors.black,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
