import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/MainModels/user_model.dart';
import 'package:untitled13/Screens/Success/Controller/success_page_controller.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen({Key? key}) : super(key: key);

  SuccessController successController = Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/anim/success.json'),
              const AutoSizeText(
                'سفارش شما با موفقیت ثبت شد',
                maxLines: 1,
                maxFontSize: 20.0,
                minFontSize: 16.0,
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              (Blocs.user.user is UserModel)
                  ? const SizedBox()
                  : const AutoSizeText(
                      'دوس داری عضوی از ما باشی ؟',
                      maxLines: 1,
                      maxFontSize: 16.0,
                      minFontSize: 12.0,
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 14.0,
                      ),
                    ),
              SizedBox(
                height: Get.height * .02,
              ),
              (Blocs.user.user is UserModel)
                  ? const SizedBox()
                  : Container(
                      width: Get.width,
                      height: Get.height * .05,
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width * .04,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/loginscreen',
                                  arguments: 3,
                                );
                              },
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: ColorUtils.main,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: kElevationToShadow[1],
                                ),
                                child: const Center(
                                  child: AutoSizeText(
                                    'آره حتما',
                                    maxFontSize: 18.0,
                                    minFontSize: 14.0,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .05,
                          ),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                successController.deleteData();
                              },
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorUtils.main,
                                    width: .8,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Center(
                                  child: AutoSizeText(
                                    'نه بیخیالش',
                                    style: TextStyle(
                                      color: ColorUtils.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
