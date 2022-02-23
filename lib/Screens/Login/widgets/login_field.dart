import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';

class PassWordLoginField extends StatelessWidget {
  const PassWordLoginField({Key? key, this.loginController}) : super(key: key);
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .4,
      width: Get.width * .8,
      color: Colors.white,
      child: GetBuilder(
        init: loginController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height * .3,
              width: Get.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "رمز عبور خود را وارد کنید",
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 18,
                      ),
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
                  SizedBox(
                    width: Get.width,
                    height: Get.height * .06,
                    child: Center(
                      child: TextField(
                        autofocus: false,
                        controller: loginController!.passWordController,
                        textAlign: TextAlign.left,
                        enabled: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                            11,
                          ),
                        ],
                        onChanged: (text){
                          if(text.length == 11){
                            FocusScope.of(context).unfocus();
                            loginController!.getLoginAPI();
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorUtils.mainDote,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: "* * * * * * *",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorUtils.mainDote,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
