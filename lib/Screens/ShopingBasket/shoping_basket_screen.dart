import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/FirstProductCategory/Controller/product_sub_category_controller.dart';
import 'Controller/shoping_basket_controller.dart';
import 'Widgets/finished_button_order_shoping_basket.dart';
import 'Widgets/modal_reserve_table_widget.dart';
import 'Widgets/order_list_shoping_basket.dart';
import 'Widgets/sum_price_order_shoping_basket.dart';

class ShoppingBasketScreen extends StatelessWidget {
  ShoppingBasketScreen({Key? key}) : super(key: key);

  final ShoppingBasketController shoppingBasketController =
      Get.put(ShoppingBasketController());

  final ProductCategoryController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
                    child: const AutoSizeText(
                      'سبد خرید',
                      maxLines: 1,
                      maxFontSize: 16.0,
                      minFontSize: 12.0,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: Get.width,
                  child: Column(
                    children: [
                      OrderListShoppingBasket(
                        shoppingBasketController: shoppingBasketController,
                        productController: productController,
                      ),
                      SumPriceOrderShoppingBasket(
                        shoppingBasketController: shoppingBasketController,
                      ),
                      SizedBox(height: Get.height * .05,),
                      ModalReserveTableShoppingBasket(
                        shoppingBasketController: shoppingBasketController,
                      ),
                    ],
                  ),
                ),
              ),
              FinishedButtonOrderShoppingBasket(
                shoppingBasketController: shoppingBasketController,
              ),
              // Container(
              //   color: ColorUtils.red,
              //   height: Get.height * .54,
              //   width: Get.width,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       OrderListShoppingBasket(
              //         shoppingBasketController:
              //             shoppingBasketController,
              //       ),
              //       SumPriceOrderShoppingBasket(
              //         shoppingBasketController:
              //             shoppingBasketController,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: Get.height * .04,
              // ),
              // (shoppingBasketController.whichPage == 2)
              //     ? Container(
              //         color: Colors.transparent,
              //         height: Get.height * .05,
              //         width: Get.height * .1,
              //       )
              //     : ModalReserveTableShoppingBasket(
              //         shoppingBasketController:
              //             shoppingBasketController,
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
