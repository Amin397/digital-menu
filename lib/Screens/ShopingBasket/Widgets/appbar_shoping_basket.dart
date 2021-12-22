import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class AppBarShoppingBasket extends StatelessWidget {
  final ShoppingBasketController? shoppingBasketController;

  const AppBarShoppingBasket({Key? key, this.shoppingBasketController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appBarShoppingBasket();
  }

  Widget appBarShoppingBasket() {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: Get.height * .06,
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.only(left: Get.width * .05),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff44E331),
          ),
        ),
      ),
    );
  }
}
