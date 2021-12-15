import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/home_screen.dart';
import 'package:untitled13/Screens/Login/login_controller/login_controller.dart';

class SigninFinishdButton extends StatelessWidget {
  const SigninFinishdButton({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return finishdbutton();
  }

  Widget finishdbutton() {
    return Container(
      height: Get.height * .12,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: Get.width * .10),
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(.5),
            Colors.white.withOpacity(.6),
            Colors.white.withOpacity(.8),
            Colors.white.withOpacity(.9),
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (() => Get.to(
                    HomeScreen(),
                  )),
              child: Container(
                height: Get.height * .04,
                width: Get.width * .35,
                decoration: BoxDecoration(
                  color: Color(0xff49B728),
                  borderRadius: BorderRadius.circular(Get.height * .012),
                ),
                child: Center(
                  child: AutoSizeText(
                    "ثبت شماره تلفن",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() => Get.to(
                    HomeScreen(),
                  )),
              child: Container(
                height: Get.height * .04,
                width: Get.width * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.height * .012),
                  border: Border.all(
                    width: Get.width * .003,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
                child: Center(
                  child: AutoSizeText(
                    "انصراف",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
