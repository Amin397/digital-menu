import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Home/Controller/home_controller.dart';
import 'package:untitled13/Screens/Home/Model/contractor_sub_category_model.dart';

class HomeCategoryFood extends StatelessWidget {
  const HomeCategoryFood({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homeCategoryFood();
  }

  Widget homeCategoryFood() {
    return Container(
      margin: EdgeInsets.only(
        top: Get.height * .035,
      ),
      height: Get.height * .55,
      width: Get.width * .9,
      child: Obx(
        () => (homeController!.isLoaded.value)
            ? (homeController!.categoryList.isNotEmpty)
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 3.5,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: homeController!.categoryList.length,
                    itemBuilder: (context, index) => _buildCardsViewItem(
                      item: homeController!.categoryList[index],
                    ),
                  )
                : const Center(
                    child: Text(
                      'داده ای یافت نشد',
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _buildCardsViewItem({
    ContractorSubCategoryModel? item,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .015,
        vertical: Get.width * .018,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            homeController!.nextPage();
          },
          child: Container(
            height: Get.height,
            width: Get.width,
            // margin: const EdgeInsets.only(
            //   top: 08,
            // ),
            decoration: BoxDecoration(
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
            child: Column(
              children: [
                SizedBox(height: Get.height * .01),
                Flexible(
                  flex: 8,
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ClipRRect(
                      child: (item!.image!.length > 10)
                          ? Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(item.image!),
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
                  init: homeController,
                  builder: (ctx){
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
                      width: homeController!.dividerHeight,
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
                          child: Container(
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
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Center(
                              child: AutoSizeText(
                                item.productCount.toString() + ' مدل غذا',
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
}
