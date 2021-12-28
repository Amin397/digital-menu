import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/FirstProductCategory/Controller/product_sub_category_controller.dart';

class SubCategoryFoodsSingle extends StatelessWidget {
  const SubCategoryFoodsSingle({Key? key, this.productCategoryController})
      : super(key: key);
  final ProductCategoryController? productCategoryController;

  @override
  Widget build(BuildContext context) {
    return subCategoryFoodsSingle();
  }

  Widget subCategoryFoodsSingle() {
    return GetBuilder(
      init: productCategoryController,
      builder: (ctx) {
        return SizedBox(
            height: (productCategoryController!.productList.last.length) *
                Get.height *
                .22,
            width: Get.width,
            child: (productCategoryController!.productList.isNotEmpty)
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        productCategoryController!.productList.last.length,
                    itemBuilder: (context, index) => _buildCardsViewItem(
                      item: productCategoryController!.productList.last[index],
                    ),
                  )
                : const Center(
                    child: Text('داده ای یافت نشد'),
                  ));
      },
    );
  }

  Widget _buildCardsViewItem({
    ProductModel? item,
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
                  init: productCategoryController,
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
                                    productCategoryController!.addItem(
                                      item: item,
                                    );
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
                                        productCategoryController!
                                            .addItem(item: item);
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
                                        productCategoryController!
                                            .removeAll(item: item);
                                      },
                                      onTap: () {
                                        productCategoryController!
                                            .removeItem(item: item);
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
