import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled13/Screens/Login/login_controller/login_controller.dart';

class PassWordLoginField extends StatelessWidget {
  const PassWordLoginField({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return passWordLoginField();
  }

  Widget passWordLoginField() {
    return Container(
      height: Get.height * .4,
      width: Get.width * .8,

      child: GetBuilder(
        init: loginController,
        builder: (_)=>Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Get.height * .3,
              width: Get.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "رمز عبور خود را وارد کنید",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    height: Get.height * .06,
                    width: Get.height * .4,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.transparent,
                            height: double.maxFinite,
                            width: double.maxFinite,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * .015,
                                  width: Get.width,
                                  color: Colors.transparent,
                                ),
                                Container(
                                  height: Get.height * .04,
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      AutoSizeText(
                                        loginController!
                                            .mobileTextfieldController.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Get.height * .0015,
                                  width: Get.width,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * .05,
                    width: Get.width,

                    padding: EdgeInsets.symmetric(
                        horizontal:
                        Get.width * .04),
                    margin: EdgeInsets.symmetric(
                        horizontal:
                        Get.width * .06),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 3),
                      borderRadius:
                      BorderRadius.circular(
                          Get.height * .032),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        autofocus: false,
                        controller: loginController!.passWordController,
                        textAlign: TextAlign.left,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "* * * * * * * * *",
                            hintStyle: TextStyle(color: Colors.white)),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),


                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "فراموشی رمز عبور",
                      style: TextStyle(
                        color: Color(0xffE29805),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,

                    child: Container(
                      height: Get.height * .03,
                      width: Get.width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                loginController!.showingPass();
                              },
                              child: AnimatedContainer(
                                height: Get.height * .02,
                                width: Get.height * .02,
                                decoration: BoxDecoration(
                                  color: (loginController!
                                      .isShowPass == true)
                                      ? Color(0xffE29805)
                                      : Colors.transparent,
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius:
                                  BorderRadius.circular(Get.height * .032),
                                ),
                                duration: Duration(milliseconds: 300),
                              )),
                          AutoSizeText(
                            "نمایش رمز عبور",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height * .1,
              width: Get.width * .8,
              child: Center(
                child: GetBuilder(
                  init: loginController,
                  builder: (_) => GestureDetector(
                    onTap: () {
                      loginController!.getPassWordAPI();
                    },
                    child: Container(
                      height: Get.height * .047,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                        color: Color(0xffE29805),
                        borderRadius: BorderRadius.circular(Get.height * .03),
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
            ),
          ],
        ),
      ),
    );
  }
}
