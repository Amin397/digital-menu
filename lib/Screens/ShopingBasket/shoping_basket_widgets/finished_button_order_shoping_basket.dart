import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_controller/shoping_basket_controller.dart';

class FinishedButtonOrderShopingBasket extends StatelessWidget {

  const FinishedButtonOrderShopingBasket({Key? key, this.shopingBasketController})
      : super(key: key);
  final ShopingBasketController? shopingBasketController;

  @override
  Widget build(BuildContext context) {
    return finishedButtonOrderShopingBasket();
  }

  Widget finishedButtonOrderShopingBasket() {
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
          onTap: (){
            if (shopingBasketController!.whichPage == 1) {
              Get.toNamed('/signin', arguments: 1);
            } else if (shopingBasketController!.whichPage == 2) {
              Get.toNamed('/endOrder', arguments: 2);
            } else if (shopingBasketController!.whichPage == 3) {
              Get.toNamed('/endOrder', arguments: 3);
            }
          },
          child: Container(
            height: Get.height * .045,
            width: Get.width * .4,
            decoration: BoxDecoration(
              color: Color(0xff49B728),
              borderRadius: BorderRadius.circular(Get.height * .03),
            ),
            child: Center(
              child: AutoSizeText(
                "ثبت نهایی",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
