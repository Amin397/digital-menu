import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';

class OrderListShoppingBasket extends StatelessWidget {
  const OrderListShoppingBasket({Key? key, this.shoppingBasketController})
      : super(key: key);
  final ShoppingBasketController? shoppingBasketController;

  @override
  Widget build(BuildContext context) {
    return orderListShoppingBasket();
  }

  Widget orderListShoppingBasket() {
    return GetBuilder(
      init: shoppingBasketController,
      builder: (ctx) => SizedBox(
        height: Get.height * .45,
        width: Get.width * .9,
        child: Padding(
          padding: EdgeInsets.only(top: Get.height * .02),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Container(
              color: Colors.black.withOpacity(.2),
              height: Get.height * .0015,
            ),
            scrollDirection: Axis.vertical,
            itemCount: shoppingBasketController!.basketList.length,
            itemBuilder: (context, index) => _buildCardsViewItem(
              item: shoppingBasketController!.basketList[index],
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardsViewItem({
    SingleProductModel? item,
    int? index,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Get.height * .01,
        horizontal: Get.width * .05,
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
                    shoppingBasketController!.removeFromBasket(index);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xffB72828),
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 3,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: AutoSizeText(
                  "چلوکباب نگینی",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: SizedBox(
                  height: Get.height * .04,
                  width: Get.width * .3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/price.svg",
                        fit: BoxFit.fill,
                      ),
                      const AutoSizeText(
                        "150000 تومان",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: StreamBuilder(
                  stream: Blocs.cartBasket.getStream,
                  builder: (ctx, i) => GetBuilder(
                    init: shoppingBasketController,
                    builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        shoppingBasketController!.countBox!
                            ? Container(
                                width: Get.width * .18,
                                height: Get.height * .027,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width * .055,
                                      height: Get.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Get.height * .005),
                                        color: const Color(0xff49B728),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // productsController!.addToCart(item: item);
                                          shoppingBasketController!
                                              .plusNumber();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    AutoSizeText(
                                      item!.count.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Container(
                                      width: Get.width * .055,
                                      height: Get.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Get.height * .005),
                                        color: ColorUtils.mainRed,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          shoppingBasketController!
                                              .negativeNumber();
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: Get.width * .055,
                                height: Get.height * .027,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Get.height * .005),
                                  color: const Color(0xff49B728),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // productsController!.addToCart(item: item);
                                    shoppingBasketController!.makeCountBox();
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
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
  }
}
