import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/login_controller.dart';
import 'Widgets/background_signin_widget.dart';
import 'Widgets/finishd_button_widget.dart';

class SignInMobile extends StatelessWidget {
  SignInMobile({Key? key}) : super(key: key);

  final SigninMobileController loginController =
      Get.put(SigninMobileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: Column(
              children: const [
                Expanded(
                  child: BackGroundSignIn(),
                ),
                SignInFinishedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
