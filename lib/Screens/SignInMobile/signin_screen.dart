import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_controller/login_controller.dart';
import 'signin_widgets/background_signin_widget.dart';
import 'signin_widgets/finishd_button_widget.dart';

class SigninMobile extends StatelessWidget {
  SigninMobile({Key? key}) : super(key: key);

  final SigninMobileController loginController =
      Get.put(SigninMobileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Colors.white,
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: BackGroundSignin(),
                ),
                SigninFinishdButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
