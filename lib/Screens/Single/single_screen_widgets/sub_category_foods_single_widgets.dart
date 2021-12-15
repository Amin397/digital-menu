import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/Screens/Single/single_controller/single_controller.dart';

class SubCategoryFoodsSingle extends StatelessWidget {
  const SubCategoryFoodsSingle({Key? key, this.singleController})
      : super(key: key);
  final SingleController? singleController;

  @override
  Widget build(BuildContext context) {
    return subCategoryFoodsSingle();
  }

  Widget subCategoryFoodsSingle() {
    return Container(
      height: Get.height * .71,
      width: Get.width * .9,
      child: GetBuilder(
        init: singleController,
        builder: (_) => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: singleController!.singleList.length,
          itemBuilder: (context, index) => _buildCardsViewItem(
            item: singleController!.singleList[index],
            index: index,
          ),
        ),
      ),
    );
  }

  Widget _buildCardsViewItem({
    SingleProductModel? item,
    int? index,
  }) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * .015,
            horizontal: Get.height * .02,
          ),
          height: Get.height * .16,
          width: Get.width,
          color: Colors.white,
          child: Container(
            height: Get.height,
            width: Get.width,
            margin: EdgeInsets.symmetric(vertical: Get.height * .005),
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
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width * .03),
                    height: Get.height * .03,
                    width: Get.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "چلوکباب نگینی",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        AutoSizeText(
                          "86000 تومان",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width * .03),
                    height: Get.height * .03,
                    width: Get.width * .5,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        "برنج ایرانی، گوشت ، سینه مرغ ، گوجه ، لیموترش،",
                        maxFontSize: 12,
                        minFontSize: 06,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 08,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: Get.width * .26,
                    height: Get.height * .03,
                    margin: EdgeInsets.only(
                      right: Get.width * .03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        singleController!.CountBox!
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
                                          singleController!.plusNumber();
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
                                        color: const Color(0xffB72828),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          singleController!.negetiveNumber();
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
                                    singleController!.makeCountBox();
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
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: Get.height * .135,
            width: Get.width * .25,
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
                  child: Image(
                    height: Get.height * .12,
                    width: Get.width * .21,
                    fit: BoxFit.fill,
                    image: AssetImage(
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
