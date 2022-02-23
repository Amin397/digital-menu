import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class ReservationTableCodeAlert extends StatelessWidget {
  const ReservationTableCodeAlert({Key? key, this.controller})
      : super(key: key);
  final ShoppingBasketController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: Get.width,
        height: Get.height * .3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'اگه از قبل میز رزرو کردی ،کدی که برات پیامک شده رو وارد کن',
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * .06,
              child: TextField(
                autofocus: false,
                controller: controller!.reserveTextEditingController,
                textAlign: TextAlign.left,
                enabled: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                    6,
                  ),
                ],
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
            GestureDetector(
              onTap: (){
                controller!.getReservationCode();
              },
              child: Container(
                width: Get.width,
                height: Get.height * .05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorUtils.green,
                  boxShadow: ViewHelper.shadow(),
                ),
                child: const Center(
                  child: AutoSizeText(
                    'تایید',
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 14.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
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
