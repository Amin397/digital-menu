import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';

class FinishedButtonOrderShoppingBasket extends StatelessWidget {
  final ShoppingBasketController? shoppingBasketController;

  const FinishedButtonOrderShoppingBasket(
      {Key? key, this.shoppingBasketController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .07,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Get.height * .05,
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
            if (Blocs.aminBasket.table is TableModel) {


              shoppingBasketController!.showFinalDialog();


            } else {
              ViewHelper.errorSnackBar(
                message: 'ابتدا باید میز خود را انتخاب کنید',
              );
            }
            // if (shoppingBasketController!.whichPage == 1) {
            //   Get.toNamed('/signin', arguments: 1);
            // } else if (shoppingBasketController!.whichPage == 2) {
            //   Get.toNamed('/endOrder', arguments: 2);
            // } else if (shoppingBasketController!.whichPage == 3) {
            //   Get.toNamed('/endOrder', arguments: 3);
            // }
          },
          child: Container(
            height: Get.height * .045,
            width: Get.width * .5,
            decoration: BoxDecoration(
              color: const Color(0xff49B728),
              borderRadius: BorderRadius.circular(Get.height * .03),
            ),
            child: const Center(
              child: AutoSizeText(
                "ثبت نهایی سفارش",
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
