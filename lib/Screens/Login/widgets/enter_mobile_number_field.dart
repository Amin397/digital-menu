import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/controller/login_controller_amin_khademi.dart';


class EnterMobileNumberField extends StatelessWidget {
  EnterMobileNumberField({Key? key , this.loginController}) : super(key: key);
  LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height * .4,
        width: Get.width * .8,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              height: Get.height * .1,
              width: Get.width * .8,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "شماره موبایل خود را وارد کنید",
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height * .06,
                    child: TextField(
                      autofocus: false,
                      controller: loginController!.mobileTextfieldController,
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
                        hintText: "123456",
                        hintStyle: const TextStyle(
                          color: Colors.white,
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
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .1,
              width: Get.width * .8,
              child: Center(
                child: GetBuilder(
                  init: loginController!,
                  builder: (_) => GestureDetector(
                    onTap: () {
                      if (loginController!.whichPage ==
                          2) {
                        // 2 && loginController!.mobileTextfieldController) {
                        loginController!.getLoginAPI();
                      } else if (loginController!
                          .whichPage ==
                          3) {
                        FocusScope.of(context).unfocus();
                        loginController!.getLoginAPI();
                      }
                    },
                    child: Container(
                      height: Get.height * .047,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                        color:
                        const Color(0xffE29805),
                        borderRadius:
                        BorderRadius.circular(
                          Get.height * .03,
                        ),
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
