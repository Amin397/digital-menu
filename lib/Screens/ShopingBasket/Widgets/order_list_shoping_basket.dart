import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/FirstProductCategory/Controller/product_sub_category_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class OrderListShoppingBasket extends StatelessWidget {
  const OrderListShoppingBasket({
    Key? key,
    this.shoppingBasketController,
    this.productController,
  }) : super(key: key);
  final ShoppingBasketController? shoppingBasketController;
  final ProductCategoryController? productController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: shoppingBasketController,
      builder: (ctx) {
        return SizedBox(
          height: Get.height * .6,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.only(top: Get.height * .02),
            child: AnimationLimiter(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: Blocs.aminBasket.basket.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: _buildProductItem(
                          item: Blocs.aminBasket.basket[index],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return AnimatedContainer(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    height: 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorUtils.red.withOpacity(.05),
                          ColorUtils.red.withOpacity(.2),
                          ColorUtils.red,
                          ColorUtils.red.withOpacity(.2),
                          ColorUtils.red.withOpacity(.05),
                        ],
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: Get.height * .01,
                      horizontal: 4.0,
                    ),
                    width: shoppingBasketController!.dividerHeight,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductItem({
    ProductModel? item,
  }) {
    return StreamBuilder(
      stream: Blocs.aminBasket.getStream,
      builder: (BuildContext context, i) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * .01,
            horizontal: Get.width * .02,
          ),
          height: Get.height * .05,
          width: Get.width,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Blocs.aminBasket.removeCompleteProduct(
                          item: item,
                        );
                        shoppingBasketController!.update();
                        productController!.update();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffB72828),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      item!.ownName!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        // ViewHelper.moneyFormat(productPrice),
                        item.sumPrice!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      const AutoSizeText(
                        'تومان',
                        maxFontSize: 12.0,
                        minFontSize: 8.0,
                        maxLines: 1,
                        style: TextStyle(
                          color: ColorUtils.grey,
                          fontSize: 10.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: StreamBuilder(
                      stream: Blocs.cartBasket.getStream,
                      builder: (ctx, i) => Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Get.height * .005,
                        ),
                        width: Get.width * .25,
                        height: Get.height * .04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(
                          //   color: ColorUtils.grey.withOpacity(.5),
                          //   width: 1.0,
                          // ),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  Blocs.aminBasket.addToCart(
                                    item: item,
                                  );
                                  productController!.update();
                                },
                                child: Container(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    boxShadow: kElevationToShadow[1],
                                    color: const Color(0xff49B728),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: Center(
                                  child: AutoSizeText(
                                    item.count.toString(),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: InkWell(
                                onLongPress: () {
                                  Blocs.aminBasket.removeCompleteProduct(
                                    item: item,
                                  );
                                },
                                onTap: () {
                                  if (item.count == 1) {
                                    if (Blocs.aminBasket.basket.length == 1) {
                                      Blocs.aminBasket.removeCompleteProduct(
                                        item: item,
                                      );
                                      shoppingBasketController!.update();
                                      Get.back();
                                    } else {
                                      Blocs.aminBasket.removeCompleteProduct(
                                        item: item,
                                      );
                                      shoppingBasketController!.update();
                                    }
                                  } else {
                                    Blocs.aminBasket.removeFromBasket(
                                      item: item,
                                    );
                                  }
                                  productController!.update();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4.0),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: ColorUtils.red.withOpacity(.7),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 16,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
