import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Single/Controller/single_controller.dart';

class FinishedButtonSingle extends StatelessWidget {
  const FinishedButtonSingle({Key? key, this.singleController})
      : super(key: key);
  final SingleController? singleController;

  @override
  Widget build(BuildContext context) {
    return finishedButtonSingle();
  }

  Widget finishedButtonSingle() {
    return Container(
      height: Get.height * .07,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Get.height * .07,
          ),
          topRight: Radius.circular(
            Get.height * .07,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.4),
            spreadRadius: 2,
            blurRadius: 3,
            // offset: const Offset(0, 3),
            offset: const Offset(
              0.0,
              -1.0,
            ),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (singleController!.whichPage == 1) {
              Get.toNamed('/shopingBasket', arguments: 1);
            } else if (singleController!.whichPage == 2) {
              Get.toNamed('/shopingBasket', arguments: 2);
            } else if (singleController!.whichPage == 3) {
              Get.toNamed('/shopingBasket', arguments: 3);
            }
          },
          child: Container(
            height: Get.height * .045,
            width: Get.width * .4,
            decoration: BoxDecoration(
              color: const Color(0xff49B728),
              borderRadius: BorderRadius.circular(Get.height * .03),
            ),
            child: const Center(
              child: AutoSizeText(
                "ثبت سفارش",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
