import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Helpers/widget_helper.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class FinalDetailDialog extends StatelessWidget {
  const FinalDetailDialog({Key? key, this.shoppingBasketController})
      : super(key: key);
  final ShoppingBasketController? shoppingBasketController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.height * .6,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'اگه چیز دیگه ای لازم داشتی برامون بنویس',
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 12.0,
              ),
            ),
            _buildMainItems(),
            _buildFinalButton()
          ],
        ),
      ),
    );
  }

  Widget _buildFinalButton() {
    return GestureDetector(
      onTap: () {
        if (shoppingBasketController!.gatewayList
            .any((element) => element.isSelected!)) {
          shoppingBasketController!.finalSubmit();
        } else {
          ViewHelper.errorSnackBar(
            message: 'ابتدا روش پرداخت را مشخص کنید',
          );
        }
      },
      child: Container(
        width: Get.width,
        margin: EdgeInsets.only(
          top: Get.height * .01,
        ),
        height: Get.height * .06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: ColorUtils.green,
        ),
        child: const Center(
          child: AutoSizeText(
            'ثبت تنهایی',
            maxFontSize: 18.0,
            maxLines: 1,
            minFontSize: 14.0,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainItems() {
    return GetBuilder(
      init: shoppingBasketController,
      builder: (ctx) => Expanded(
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              (Blocs.shop.shopModel!.hasGateway == 1)
                  ? GestureDetector(
                      onTap: () {
                        shoppingBasketController!.gatewayList[1].isSelected =
                            false;
                        shoppingBasketController!.gatewayList[0].isSelected =
                            true;
                        shoppingBasketController!.update();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 270),
                        width: Get.width,
                        height: Get.height * .1,
                        margin: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: (shoppingBasketController!
                                      .gatewayList[0].isSelected!)
                                  ? ColorUtils.red
                                  : ColorUtils.grey.withOpacity(.8),
                              width: 1,
                            ),
                            color: Colors.white,
                            boxShadow: kElevationToShadow[
                                (shoppingBasketController!
                                        .gatewayList[0].isSelected!)
                                    ? 1
                                    : 0]),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: Center(
                                  child: AutoSizeText(
                                    shoppingBasketController!
                                        .gatewayList[0].title!,
                                    maxLines: 1,
                                    maxFontSize: 18.0,
                                    minFontSize: 14.0,
                                    style: const TextStyle(
                                      color: ColorUtils.textColor,
                                      fontSize: 16.0,
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
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/anim/payment.json',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  shoppingBasketController!.gatewayList[0].isSelected = false;
                  shoppingBasketController!.gatewayList[1].isSelected = true;
                  shoppingBasketController!.update();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 270),
                  width: Get.width,
                  height: Get.height * .1,
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    border: Border.all(
                      color:
                          (shoppingBasketController!.gatewayList[1].isSelected!)
                              ? ColorUtils.red
                              : ColorUtils.grey.withOpacity(.8),
                      width: 1,
                    ),
                    boxShadow: kElevationToShadow[
                        (shoppingBasketController!.gatewayList[1].isSelected!)
                            ? 1
                            : 0],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: Center(
                            child: AutoSizeText(
                              shoppingBasketController!.gatewayList[1].title!,
                              maxLines: 1,
                              maxFontSize: 18.0,
                              minFontSize: 14.0,
                              style: const TextStyle(
                                color: ColorUtils.textColor,
                                fontSize: 16.0,
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
                          child: Center(
                            child: Lottie.asset(
                              'assets/anim/money.json',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: WidgetHelper.textFormField(
                    controller: shoppingBasketController!.detailTextController,
                    width: Get.width,
                    height: double.maxFinite,
                    numeric: false,
                    maxLines: 15,
                    label: 'توضیحات',
                    hintSize: 14.0,
                    textAlign: TextAlign.left,
                    enable: true,
                    autoFocus: false,
                    focusedColor: ColorUtils.main,
                    placeHolderColor: ColorUtils.grey,
                    borderColor: ColorUtils.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
