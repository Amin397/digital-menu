import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_controller/shoping_basket_controller.dart';

class AppBarShopingBasket extends StatelessWidget {
  const AppBarShopingBasket({Key? key, this.shopingBasketController}) : super(key: key);
  final ShopingBasketController? shopingBasketController;

  @override
  Widget build(BuildContext context) {
    return appBarShopingBasket();
  }

  Widget appBarShopingBasket() {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: Get.height * .06,
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.only(left: Get.width * .05),
        child: Align(
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
