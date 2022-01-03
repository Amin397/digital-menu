import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/MainModels/get_routs.dart';

import 'Controller/login_alert_controller.dart';

class LoginAlertDialog extends StatelessWidget {
  LoginAlertDialog({Key? key}) : super(key: key);

  LoginAlertController controller = Get.put(LoginAlertController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.height * .5,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            _buildAppBar(),
            GetBuilder(
              init: controller,
              builder: (ctx) {
                return AnimatedContainer(
                  duration: const Duration(
                    seconds: 1,
                  ),
                  height: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorUtils.red.withOpacity(.05),
                        ColorUtils.red.withOpacity(.2),
                        ColorUtils.red,
                        ColorUtils.red.withOpacity(.2),
                        ColorUtils.red.withOpacity(.05),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: Get.width * .05,
                    vertical: Get.width * .01,
                  ),
                  width: controller.dividerHeight,
                );
              },
            ),
            _buildAnimationPart(),
            _buildButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Flexible(
      flex: 1,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: Get.height * .035,
          horizontal: Get.width * .04,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  // Get.toNamed(NameRouts.signinMobile);
                },
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorUtils.green,
                    boxShadow: kElevationToShadow[1],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      'میخوام ثبت نام کنم',
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
              width: Get.width * .04,
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Center(
                    child: TextButton(
                      child: const AutoSizeText(
                        'نه بیخیالش',
                        style: TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.toNamed('/shopingBasket');
                      },
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

  Widget _buildAppBar() {
    return Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * .03,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: const Center(
          child: AutoSizeText(
            'درصورت ثبت نام تو سایت ما میتونی از تخفیفات باحال ما استفاده کنی',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationPart() {
    return Flexible(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * .03,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Lottie.asset('assets/anim/gift 2.json'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Lottie.asset('assets/anim/gift1.json'),
            ),
            Center(
              child: Lottie.asset('assets/anim/fire2.json'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Lottie.asset('assets/anim/fire1.json'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Lottie.asset('assets/anim/fire3.json'),
            ),
          ],
        ),
      ),
    );
  }
}
