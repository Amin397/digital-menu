import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/ProductList/Controller/product_list_controller.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key, this.controller}) : super(key: key);
  ProductListController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        height: double.maxFinite,
        child: Obx(
          () => (controller!.isLoaded.value)
              ? (controller!.productList.isNotEmpty)
                  ? ListView.builder(
                      itemCount: controller!.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildProductItem(
                          item: controller!.productList[index],
                          index: index,
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'محصولی یافت نشد',
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget _buildProductItem({
    ProductModel? item,
    int? index,
  }) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Get.height * .015,
            horizontal: Get.height * .02,
          ),
          height: Get.height * .16,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.height * .01),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 2,
                blurRadius: 3,
                // offset: const Offset(0, 3),
                offset: const Offset(
                  0.0,
                  1.0,
                ),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: Get.width * .02,
                ),
                height: Get.height * .03,
                width: Get.width * .6,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        child: AutoSizeText(
                          item!.ownName!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        height: Get.height * .03,
                        width: double.maxFinite,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: Get.height * .03,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            AutoSizeText(
                              ViewHelper.moneyFormat(
                                double.parse(
                                  item.price.toString(),
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            const AutoSizeText(
                              ' تومان',
                              maxLines: 1,
                              maxFontSize: 12.0,
                              minFontSize: 8.0,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: Get.width * .02,
                ),
                height: Get.height * .03,
                width: Get.width * .6,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    item.detail!,
                    maxLines: 2,
                    maxFontSize: 12.0,
                    minFontSize: 8.0,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GetBuilder(
                  init: controller,
                  builder: (ctx) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (
                        widget,
                        animation,
                      ) =>
                          ScaleTransition(scale: animation, child: widget),
                      child: (item.count == 0)
                          ? Align(
                              key: UniqueKey(),
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: Get.width * .03,
                                ),
                                width: Get.width * .07,
                                height: Get.height * .03,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Get.height * .005,
                                  ),
                                  color: const Color(0xff49B728),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller!.addItem(item: item);
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
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                right: Get.width * .03,
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
                                        controller!.addItem(item: item);
                                      },
                                      child: Container(
                                        height: double.maxFinite,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          boxShadow: kElevationToShadow[1],
                                          color: const Color(0xff49B728),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                        controller!.removeAll(item: item);
                                      },
                                      onTap: () {
                                        controller!.removeItem(item: item);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(4.0),
                                        height: double.maxFinite,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                    );
                  },
                ),
              )

              // StreamBuilder(
              //   stream: Blocs.aminBasket.getStream,
              //   builder: (BuildContext context, i) {
              //     if (item.count == 0) {
              //       return
              //     } else {
              //       return Container(
              //         height: 20.0,
              //         width: 20.0,
              //         color: Colors.red,
              //       );
              //     }
              //   },
              // )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: Get.width * .02,
            ),
            height: Get.height * .135,
            width: Get.width * .3,
            // padding: EdgeInsets.only(bottom: Get.height * .01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Get.height * .01,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Get.height * .01,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        spreadRadius: 3,
                        blurRadius: 3,
                        // offset: const Offset(0, 3),
                        offset: const Offset(
                          0.0,
                          3.0,
                        ),
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Get.height * .01,
                  ),
                  child: (item.image!.length > 10)
                      ? Image(
                          height: Get.height * .14,
                          width: Get.width * .3,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            item.image!,
                          ),
                        )
                      : Image(
                          height: Get.height * .14,
                          width: Get.width * .3,
                          fit: BoxFit.fill,
                          image: const AssetImage(
                            'assets/images/singleImage.jpg',
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
