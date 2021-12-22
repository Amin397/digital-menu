import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SignInMobile/Controller/login_controller.dart';
import 'mobile_text_field_login_widget.dart';
import 'note_signin.dart';

class BackGroundSignIn extends StatelessWidget {
  const BackGroundSignIn({Key? key, this.signInMobileController})
      : super(key: key);
  final SigninMobileController? signInMobileController;

  @override
  Widget build(BuildContext context) {
    return backgroundSignIn();
  }

  Widget backgroundSignIn() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Get.height * .3,
              width: Get.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
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
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/singInResturant.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
