import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_controller/shoping_basket_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_model/shoping_basket_model.dart';

class ModalReserveTableShopingBasket extends StatelessWidget {

  const ModalReserveTableShopingBasket({Key? key, this.shopingBasketController})
      : super(key: key);
  final ShopingBasketController? shopingBasketController;

  @override
  Widget build(BuildContext context) {
    return modalReserveTableShopingBasket();
  }

  Widget modalReserveTableShopingBasket() {
    return GestureDetector(
      onTap: () {
        showTableModal();
      },
      child: Container(
        height: Get.height * .05,
        width: Get.width * .32,
        padding: EdgeInsets.only(right: Get.width * .05),
        child: Row(
          children: [
            AutoSizeText(
              "انتخاب میز",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xffD4970A),
          borderRadius:
          BorderRadius.circular(Get.height * .008),
        ),
      ),
    );
  }
  showTableModal() {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(top: Get.height * .1),
            child: Container(
              height: Get.height,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Get.height * .04,
                  ),
                  topLeft: Radius.circular(
                    Get.height * .04,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .015,
                  ),
                  Container(
                    height: Get.height * .055,
                    width: Get.width * .8,
                    decoration: BoxDecoration(
                      color: Color(0xffD4970A),
                      borderRadius: BorderRadius.circular(Get.height * .015),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "میز خود را انتخاب کنید",
                        maxLines: 1,
                        maxFontSize: 20.0,
                        minFontSize: 12.0,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Expanded(
                    child: Container(
                      height: double.maxFinite,
                      width: Get.width * .8,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                                height: Get.height * .05,
                                width: Get.width,
                                color: Colors.transparent,
                                margin: EdgeInsets.only(top: Get.height * .158),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: Get.height * .0015,
                                      width: Get.width,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      height: Get.height * .0015,
                                      width: Get.width,
                                      color: Colors.black,
                                    ),
                                  ],
                                )),
                            PageView.builder(
                              controller:
                              shopingBasketController!.pageController,
                              onPageChanged: (page) {
                                shopingBasketController!.changePage(page);
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: shopingBasketController!
                                  .selectTableList.length,
                              itemBuilder: (context, index) =>
                                  _buildTableNumberViewItem(
                                    item: shopingBasketController!
                                        .selectTableList[index],
                                    index: index,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTableNumberViewItem({
    TableModel? item,
    int? index,
  }) {
    return Container(
      height: Get.height * .06,
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: Get.height * .01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder(
            init: shopingBasketController,
            builder: (_) => Container(
              height: Get.height * .045,
              width: Get.width,
              child: Center(
                child: (shopingBasketController!.currentPage == index)
                    ? AutoSizeText(
                  "${item!.count}",
                  maxLines: 1,
                  maxFontSize: 28.0,
                  minFontSize: 20.0,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                )
                    : AutoSizeText(
                  "${item!.count}",
                  maxLines: 1,
                  maxFontSize: 28.0,
                  minFontSize: 20.0,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 24.0,
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
