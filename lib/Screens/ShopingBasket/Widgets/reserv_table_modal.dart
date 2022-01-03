import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';

class ReserveTableModal extends StatelessWidget {
  const ReserveTableModal({Key? key, this.shoppingBasketController})
      : super(key: key);

  final ShoppingBasketController? shoppingBasketController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(
          top: Get.height * .015,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              Get.height * .03,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * .055,
              width: Get.width,
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .1,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffD4970A),
                borderRadius: BorderRadius.circular(Get.height * .015),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  const AutoSizeText(
                    "میز خود را انتخاب کنید",
                    maxLines: 1,
                    maxFontSize: 20.0,
                    minFontSize: 12.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      color: Color(0xffD4970A),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            GetBuilder(
              init: shoppingBasketController,
              builder: (ctx) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .05,
                      vertical: Get.height * .05,
                    ),
                    height: double.maxFinite,
                    width: Get.width,
                    child: Center(
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              height: Get.height * .05,
                              width: Get.width,
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
                              ),
                            ),
                          ),
                          PageView.builder(
                            controller:
                                shoppingBasketController!.pageController,
                            onPageChanged: (page) {
                              shoppingBasketController!.changePage(page);
                            },
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                shoppingBasketController!.tableList!.length,
                            itemBuilder: (context, index) =>
                                _buildTableNumberViewItem(
                              item: shoppingBasketController!.tableList![index],
                              index: index,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                // print(shoppingBasketController!.tableList![shoppingBasketController!.currentPage].name);
                Blocs.aminBasket.setTable(
                  tableModel: shoppingBasketController!
                      .tableList![shoppingBasketController!.currentPage],
                );
              },
              child: Container(
                height: Get.height * .05,
                width: Get.width,
                color: Colors.red,
                child: const Center(
                  child: AutoSizeText(
                    'انتخاب میز',
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 14.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
            init: shoppingBasketController,
            builder: (_) => Container(
              height: Get.height * .045,
              width: Get.width,
              child: Row(
                children: [
                  (item!.name!.isEmpty)
                      ? Container()
                      : _buildTableName(
                          item: item,
                          index: index,
                        ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  _buildCapacity(
                    item: item,
                    index: index,
                  ),
                  _buildTableNumber(
                    item: item,
                    index: index,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableName({
    TableModel? item,
    int? index,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'نام میز : ',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Flexible(
              flex: 3,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    item!.name!,
                    maxLines: 1,
                    maxFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 20.0
                            : 18.0,
                    minFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 16.0
                            : 12.0,
                    style: TextStyle(
                      color: (shoppingBasketController!.currentPage == index)
                          ? Colors.black
                          : Colors.grey,
                      fontSize: (shoppingBasketController!.currentPage == index)
                          ? 18.0
                          : 14.0,
                      fontWeight:
                          (shoppingBasketController!.currentPage == index)
                              ? FontWeight.bold
                              : FontWeight.w500,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCapacity({
    TableModel? item,
    int? index,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'ظرفیت :',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    item!.capacity.toString() + 'نفر',
                    maxLines: 1,
                    maxFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 20.0
                            : 18.0,
                    minFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 16.0
                            : 12.0,
                    style: TextStyle(
                      color: (shoppingBasketController!.currentPage == index)
                          ? Colors.black
                          : Colors.grey,
                      fontSize: (shoppingBasketController!.currentPage == index)
                          ? 18.0
                          : 14.0,
                      fontWeight:
                          (shoppingBasketController!.currentPage == index)
                              ? FontWeight.bold
                              : FontWeight.w500,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableNumber({
    TableModel? item,
    int? index,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'شماره میز : ',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    item!.number.toString(),
                    maxLines: 1,
                    maxFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 20.0
                            : 18.0,
                    minFontSize:
                        (shoppingBasketController!.currentPage == index)
                            ? 16.0
                            : 12.0,
                    style: TextStyle(
                      color: (shoppingBasketController!.currentPage == index)
                          ? Colors.black
                          : Colors.grey,
                      fontSize: (shoppingBasketController!.currentPage == index)
                          ? 18.0
                          : 14.0,
                      fontWeight:
                          (shoppingBasketController!.currentPage == index)
                              ? FontWeight.bold
                              : FontWeight.w500,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
