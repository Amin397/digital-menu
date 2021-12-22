import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';

class FinishedButtonLogin extends StatelessWidget {
  const FinishedButtonLogin({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;



  @override
  Widget build(BuildContext context) {
    return finishedButtonLogin();
  }

  Widget finishedButtonLogin() {
    return Container(
      height: Get.height * .1,
      width: Get.width * .8,
      child: Center(
        child: GetBuilder(
          init: loginController,
          builder: (_) => GestureDetector(
            onTap: () {
              if (loginController!
                  .whichPage ==
                  2) {
                loginController!
                    .getLoginAPI();
              } else if (loginController!
                  .whichPage ==
                  3) {
                loginController!
                    .getLoginAPI();
              }
            },
            child: Container(
              height: Get.height * .047,
              width: Get.width * .4,
              decoration: BoxDecoration(
                color: Color(0xffE29805),
                borderRadius:
                BorderRadius.circular(
                    Get.height * .03),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  "ورود",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
