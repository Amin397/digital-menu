import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';

class TopPartLoginScreen extends StatelessWidget {
  const TopPartLoginScreen({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;



  @override
  Widget build(BuildContext context) {
    return topPartLoginScreen();
  }

  Widget topPartLoginScreen() {
    return Row(
      children: [
        Container(
          height: Get.height * .2,
          width: Get.width * .5,
          color: ColorUtils.mainRed,
          child: Center(
            child: Transform.rotate(
              angle: .3,
              child: Container(
                height: Get.height * .11,
                width: Get.width * .43,
                decoration: BoxDecoration(
                  color: const Color(0xffE29805),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Get.height * .03,
                    ),
                    bottomRight: Radius.circular(
                      Get.height * .03,
                    ),
                    topRight: Radius.circular(
                      Get.height * .03,
                    ),
                    bottomLeft: Radius.circular(
                      Get.height * .055,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: .02,
                    child: Container(
                      height: Get.height * .09,
                      width: Get.width * .40,
                      decoration: BoxDecoration(
                        color: const Color(0xffE29805),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            Get.height * .03,
                          ),
                          bottomRight: Radius.circular(
                            Get.height * .03,
                          ),
                          topRight: Radius.circular(
                            Get.height * .03,
                          ),
                          bottomLeft: Radius.circular(
                            Get.height * .055,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: AutoSizeText(
                          "ورود/ ثبت نام",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * .2,
          width: Get.width * .5,
        ),
      ],
    );
  }
}
