import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled13/Screens/Login/login_controller/login_controller.dart';

class PinCodeLoginField extends StatelessWidget {
  const PinCodeLoginField({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;



  @override
  Widget build(BuildContext context) {
    return passWordLoginField();
  }

  Widget passWordLoginField() {
    return SizedBox(
      height: Get.height * .4,
      width: Get.width * .8,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Get.height * .25,
            width: Get.width * .8,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "شماره مبایل خود را وارد کنید",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
                Container(
                  height: Get.height * .06,
                  width: Get.height * .5,
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
                                height: Get.height *
                                    .015,
                                width: Get.width,
                                color: Colors
                                    .transparent,
                              ),
                              Container(
                                height: Get.height *
                                    .04,
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors
                                          .white,
                                    ),
                                    AutoSizeText(
                                      loginController!.mobileTextfieldController.text,
                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white,
                                        fontSize:
                                        16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.height *
                                    .0015,
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
                  height: Get.height * .06,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * .01),
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .08),
                  decoration: BoxDecoration(),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(

                      controller: loginController!.pinCodeController,
                      appContext: Get.context!,
                      onTap: () {},
                      onCompleted: (value) {},
                      onChanged: (newValue) {},
                      length: 4,
                      obscureText: false,
                      animationType:
                      AnimationType.fade,
                      cursorColor: Colors.white,

                      pinTheme: PinTheme(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        borderRadius:
                        BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,

                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      loginController!.sendAgainGetPinCodeAPI();
                    },
                    child: AutoSizeText(
                      "ارسال مجدد کد",
                      style: TextStyle(
                        color: Color(0xffE29805),
                        fontSize: 14,
                      ),
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
                    loginController!.getPinCodeAPI();

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
          ),
        ],
      ),
    );
  }
}
