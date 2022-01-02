import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/MainModels/get_routs.dart';
import 'package:untitled13/Screens/FirstProductCategory/Controller/product_sub_category_controller.dart';
import 'package:untitled13/Screens/FirstProductCategory/Model/single_model.dart';

class CategoryFoodsSingle extends StatelessWidget {
  const CategoryFoodsSingle({Key? key, this.productCategoryController})
      : super(key: key);
  final ProductCategoryController? productCategoryController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .1,
      width: Get.width,
      child: GetBuilder(
        init: productCategoryController,
        builder: (ctx) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: productCategoryController!.categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildCardsViewItem(
                item: productCategoryController!.categoryList[index],
                index: index,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCardsViewItem({
    ProductCategoryModel? item,
    int? index,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .02,
        vertical: Get.width * .02,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            // productCategoryController!.nextApi(item: item);
            productCategoryController!.filterProduct(item: item,);
            //
            // switch (productCategoryController!.categoryList.length) {
            //   case 1:
            //     {
            //
            //       break;
            //     }
            //   case 2:
            //     {
            //       productCategoryController!.secondApi(item: item);
            //       break;
            //     }
            //   default:
            //     {
            //       Get.toNamed(NameRouts.productList, arguments: {
            //         'category': item,
            //         'index': index,
            //       });
            //     }
            // }
            // homeController!.nextPage(item!.id);
          },
          child: AnimatedContainer(
            height: Get.height,
            width: Get.width * .45,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    (item!.isSelected!) ? ColorUtils.red : Colors.transparent,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(Get.height * .008),
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
            duration: const Duration(milliseconds: 270),
            child: Row(
              children: [
                SizedBox(width: Get.height * .01),
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ClipRRect(
                      child: (item.icon!.length > 10)
                          ? Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(item.icon!),
                            )
                          : const Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/breackfeast.png',
                              ),
                            ),
                    ),
                  ),
                ),
                GetBuilder(
                  init: productCategoryController,
                  builder: (ctx) {
                    return AnimatedContainer(
                      duration: const Duration(
                        seconds: 1,
                      ),
                      width: 1.5,
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
                      height: productCategoryController!.dividerHeight,
                    );
                  },
                ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: AutoSizeText(
                                item.name!,
                                maxFontSize: 18.0,
                                minFontSize: 14.0,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.black,
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
                              child: AutoSizeText(
                                item.detail!,
                                maxFontSize: 14.0,
                                minFontSize: 8.0,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: ColorUtils.textColor,
                                  fontSize: 10.0,
                                ),
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
      ),
    );
  }

  Widget _buildTabBarList({ProductCategoryModel? item, int? index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .01,
        vertical: Get.width * .005,
      ),
      child: GetBuilder(
        init: productCategoryController,
        builder: (_) => Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            margin: EdgeInsets.only(
              top:
                  (productCategoryController!.currentPage == index) ? 02.0 : 08,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Get.height * .008),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(
                    0.0,
                    1.0,
                  ),
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ClipRRect(
                      child: (item!.icon!.length > 10)
                          ? Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                item.icon!,
                              ),
                            )
                          : const Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/breackfeast.png',
                              ),
                            ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        item.name!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
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
    );
  }
}
