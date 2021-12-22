import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class SumPriceOrderShoppingBasket extends StatelessWidget {
  const SumPriceOrderShoppingBasket({Key? key, this.shoppingBasketController})
      : super(key: key);
  final ShoppingBasketController? shoppingBasketController;

  @override
  Widget build(BuildContext context) {
    return sumPriceOrderShoppingBasket();
  }

  Widget sumPriceOrderShoppingBasket() {
    return Container(
      height: Get.height * .06,
      width: Get.width * .9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 3,
            // offset: const Offset(0, 3),
            offset: const Offset(
              0.0,
              3.0,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(
          Get.height * .015,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          AutoSizeText(
            "مبلغ کل صورت حساب",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          AutoSizeText(
            "120000 تومان",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
