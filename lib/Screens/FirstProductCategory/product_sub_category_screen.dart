import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'Controller/product_sub_category_controller.dart';
import 'Widgets/category_foods_single_widgets.dart';
import 'Widgets/finished_button_single.dart';
import 'Widgets/sub_category_foods_single_widgets.dart';

class ProductCategoryScreen extends StatelessWidget {
  ProductCategoryScreen({Key? key}) : super(key: key);

  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(
            () => (productCategoryController.isLoaded.value)
                ? Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          color: Colors.white,
                          child: Column(
                            children: [
                              // AppBarSingle(productCategoryController: productCategoryController),
                              SizedBox(
                                height: Get.height * .03,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.width * .05,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            child: Hero(
                                              tag: 'category-${productCategoryController.index}',
                                              child: ClipRRect(
                                                child: (productCategoryController.model!.image!.length > 10)
                                                    ? Image(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(productCategoryController.model!.image!),
                                                )
                                                    : const Image(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    'assets/images/breackfeast.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            height: Get.width * .09,
                                            width: Get.width * .09,
                                          ),
                                          const SizedBox(width: 12.0,),
                                          Hero(
                                            tag: 'name-${productCategoryController.index}',
                                            child: Text(
                                              productCategoryController
                                                  .model!.name!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        productCategoryController.goBack();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CategoryFoodsSingle(
                                        productCategoryController:
                                            productCategoryController,
                                      ),
                                      GetBuilder(
                                        init: productCategoryController,
                                        builder: (ctx) {
                                          return AnimatedContainer(
                                            duration: const Duration(
                                              seconds: 1,
                                            ),
                                            height: 1.5,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  ColorUtils.red
                                                      .withOpacity(.05),
                                                  ColorUtils.red
                                                      .withOpacity(.2),
                                                  ColorUtils.red,
                                                  ColorUtils.red
                                                      .withOpacity(.2),
                                                  ColorUtils.red
                                                      .withOpacity(.05),
                                                ],
                                              ),
                                            ),
                                            margin: EdgeInsets.symmetric(
                                              vertical: Get.height * .01,
                                              horizontal: 4.0,
                                            ),
                                            width: productCategoryController
                                                .dividerHeight,
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: Get.height * .01,
                                      ),
                                      SubCategoryFoodsSingle(
                                        productCategoryController:
                                            productCategoryController,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              // لیست
                            ],
                          ),
                        ),
                      ),
                      const FinishedButtonSingle(),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
