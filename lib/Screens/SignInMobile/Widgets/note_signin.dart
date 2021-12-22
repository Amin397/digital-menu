import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';

class SigninNote extends StatelessWidget {
  const SigninNote({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return signInNote();
  }

  Widget signInNote() {
    return SizedBox(
      height: Get.height * .2,
      width: Get.width * .8,
      child: Center(
        child: SizedBox(
          height: Get.height * .15,
          width: Get.width,
          child: const AutoSizeText(
            "اگر میخواهید از تخفیفات و امتیازات\n\nرستوران استفاده کنید و در باشگاه مشتریان\n\n عضو شوید، شماره تلفن همراه خود را وارد کنید",
            maxLines: 7,
            maxFontSize: 22.0,
            minFontSize: 16.0,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
