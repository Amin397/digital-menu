import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class ShowSuccessReserveAlert extends StatelessWidget {
  const ShowSuccessReserveAlert(
      {Key? key, this.controller, this.reservationCode})
      : super(key: key);
  final SelectKindOrderController? controller;
  final String? reservationCode;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: Get.width,
        height: Get.height * .4,
        child: Column(
          children: [
            Lottie.asset(
              'assets/anim/success.json',
              height: Get.height * .2,
              width: Get.height * .2,
            ),
            Text(
              'کد رزرو شما : $reservationCode \nوقتی تشریف آوردین برای  تحویل گرفتن میزتون این کد لازمتون میشه',
              style: const TextStyle(
                color: ColorUtils.textColor,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: double.maxFinite,
                  width: Get.width,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorUtils.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: Get.height * .05,
                      width: Get.width,
                      child: const Center(
                        child: AutoSizeText(
                          'فهمیدم',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
