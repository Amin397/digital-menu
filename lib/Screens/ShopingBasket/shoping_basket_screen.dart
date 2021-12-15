import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_widgets/order_list_shoping_basket.dart';
import 'shoping_basket_controller/shoping_basket_controller.dart';
import 'shoping_basket_widgets/appbar_shoping_basket.dart';
import 'shoping_basket_widgets/finished_button_order_shoping_basket.dart';
import 'shoping_basket_widgets/modal_reserve_table_widget.dart';
import 'shoping_basket_widgets/sum_price_order_shoping_basket.dart';

class ShopingBasketScreen extends StatelessWidget {
  ShopingBasketScreen({Key? key}) : super(key: key);

  final ShopingBasketController shopingBasketController =
      Get.put(ShopingBasketController());

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
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        AppBarShopingBasket(
                            shopingBasketController: shopingBasketController),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        Container(
                          height: Get.height * .54,
                          width: Get.width * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OrderListShopingBasket(
                                shopingBasketController:
                                    shopingBasketController,
                              ),
                              SumPriceOrderShopingBasket(
                                shopingBasketController:
                                    shopingBasketController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .04,
                        ),
                        (shopingBasketController.whichPage == 2)
                            ? Container(
                                color: Colors.transparent,
                                height: Get.height * .05,
                                width: Get.height * .1,
                              )
                            : ModalReserveTableShopingBasket(
                                shopingBasketController:
                                    shopingBasketController,
                              ),
                      ],
                    ),
                  ),
                ),
                FinishedButtonOrderShopingBasket(
                    shopingBasketController: shopingBasketController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
