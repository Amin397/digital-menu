import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/shoping_basket_controller.dart';
import 'Widgets/appbar_shoping_basket.dart';
import 'Widgets/finished_button_order_shoping_basket.dart';
import 'Widgets/modal_reserve_table_widget.dart';
import 'Widgets/order_list_shoping_basket.dart';
import 'Widgets/sum_price_order_shoping_basket.dart';

class ShoppingBasketScreen extends StatelessWidget {
  ShoppingBasketScreen({Key? key}) : super(key: key);

  final ShoppingBasketController shoppingBasketController =
      Get.put(ShoppingBasketController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                      color: Colors.white,
                    child: Column(
                      children: [
                        AppBarShoppingBasket(
                            shoppingBasketController: shoppingBasketController,),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        Container(
                          height: Get.height * .54,
                          width: Get.width * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OrderListShoppingBasket(
                                shoppingBasketController:
                                    shoppingBasketController,
                              ),
                              SumPriceOrderShoppingBasket(
                                shoppingBasketController:
                                    shoppingBasketController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .04,
                        ),
                        (shoppingBasketController.whichPage == 2)
                            ? Container(
                                color: Colors.transparent,
                                height: Get.height * .05,
                                width: Get.height * .1,
                              )
                            : ModalReserveTableShoppingBasket(
                                shoppingBasketController:
                                    shoppingBasketController,
                              ),
                      ],
                    ),
                  ),
                ),
                FinishedButtonOrderShoppingBasket(
                    shoppingBasketController: shoppingBasketController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
