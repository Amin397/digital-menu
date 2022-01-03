import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class SumPriceOrderShoppingBasket extends StatelessWidget {
  const SumPriceOrderShoppingBasket({Key? key, this.shoppingBasketController})
      : super(key: key);
  final ShoppingBasketController? shoppingBasketController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .06,
      width: Get.width,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * .05,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .03,
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  "مبلغ کل صورت حساب",
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    StreamBuilder(
                      stream: Blocs.aminBasket.getStream,
                      builder: (BuildContext context , i){
                        return Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                ViewHelper.moneyFormat(
                                  Blocs.aminBasket.finalPrice,
                                ),
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 12.0,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            'تومان',
                            maxFontSize: 14.0,
                            minFontSize: 10.0,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
