import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';

class FinishedButtonSingle extends StatelessWidget {
  const FinishedButtonSingle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Blocs.aminBasket.getStream,
      builder: (BuildContext context, i) {
        return AnimatedContainer(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .02,
          ),
          duration: const Duration(milliseconds: 270),
          height: (Blocs.aminBasket.basket.isNotEmpty) ? Get.height * .07 : 0.0,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                Get.height * .03,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // if (productCategoryController!.whichPage == 1) {
                  //   Get.toNamed('/shopingBasket', arguments: 1);
                  // } else if (productCategoryController!.whichPage == 2) {
                  //   Get.toNamed('/shopingBasket', arguments: 2);
                  // } else if (productCategoryController!.whichPage == 3) {
                  //   Get.toNamed('/shopingBasket', arguments: 3);
                  // }
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
              Container(
                height: Get.height * .045,
                width: Get.width * .2,
                color: Colors.red,
              ),

            ],
          ),
        );
      },
    );
  }
}
