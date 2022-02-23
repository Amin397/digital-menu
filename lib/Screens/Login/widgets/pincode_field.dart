import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';

class PinCodeLoginField extends StatelessWidget {
  const PinCodeLoginField({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                const AutoSizeText(
                  "شماره موبایل خود را وارد کنید",
                  maxLines: 2,
                  maxFontSize: 20.0,
                  minFontSize: 14.0,
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 18.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      loginController!.goToFirstPage();
                    },
                    child: Container(
                      height: Get.height * .06,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                              color: ColorUtils.mainRed.withOpacity(.5),
                            ),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.edit,
                            color: ColorUtils.mainRed,
                          ),
                          SizedBox(
                            width: Get.width * .05,
                          ),
                          AutoSizeText(
                            loginController!
                                .mobileTextfieldController.text,
                            style: const TextStyle(
                              color: ColorUtils.textColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * .15,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .01,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: Get.width * .08,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: PinCodeTextField(
                        controller: loginController!.pinCodeController,
                        appContext: Get.context!,
                        onTap: () {},
                        onCompleted: (value) {
                          FocusScope.of(context).unfocus();
                          loginController!.getPinCodeAPI();
                        },
                        onChanged: (newValue) {},
                        length: 4,
                        autoFocus: true,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        cursorColor: ColorUtils.mainRed,
                        pinTheme: PinTheme(
                          activeColor: ColorUtils.green,
                          inactiveColor: Colors.blue,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.black,
                        ),
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      loginController!.getLoginAPI();
                    },
                    child: const AutoSizeText(
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
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
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
                      color: const Color(0xffE29805),
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
                    child: const Center(
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
        ),
      ],
    );
  }
}
