import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SignInMobile/signin_controller/login_controller.dart';
import 'mobile_text_field_login_widget.dart';
import 'note_signin.dart';

class BackGroundSignin extends StatelessWidget {
  const BackGroundSignin({Key? key, this.signinMobileController})
      : super(key: key);
  final SigninMobileController? signinMobileController;

  @override
  Widget build(BuildContext context) {
    return backgroundSignin();
  }

  Widget backgroundSignin() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.height * .3,
                width: Get.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SigninNote(),
                    MobileTextFieldLogin(),
                  ],
                ),
              ),
              Container(
                height: Get.height * .4,
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: Get.width * .03),
                color: Colors.white,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/singInResturant.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
