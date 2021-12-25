import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Model/contractor_sub_category_model.dart';
import 'package:untitled13/Screens/Single/Controller/single_controller.dart';

class CategoryFoodsSingle extends StatelessWidget {
  const CategoryFoodsSingle({Key? key, this.singleController})
      : super(key: key);
  final SingleController? singleController;

  @override
  Widget build(BuildContext context) {
    return categoryFoodsSingle();
  }

  Widget categoryFoodsSingle() {
    return SizedBox(
      height: Get.height * .13,
      width: Get.width,
      // child: PageView.builder(
      //   controller: singleController!.pageController,
      //   scrollDirection: Axis.horizontal,
      //   onPageChanged: (page) {
      //     singleController!.changePage(page);
      //   },
      //   itemCount: singleController!.cardsList.length,
      //   itemBuilder: (context, index) => _buildTabBarList(
      //     item: singleController!.cardsList[index],
      //     index: index,
      //   ),
      // ),
    );
  }

  Widget _buildTabBarList({ContractorSubCategoryModel? item, int? index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .015,
        vertical: Get.width * .012,
      ),
      child: GetBuilder(
        init: singleController,
        builder: (_) => Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            margin: EdgeInsets.only(
              top: (singleController!.currentPage == index) ? 02.0 : 08,
            ),
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
                const Flexible(
                  flex: 8,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ClipRRect(
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/breackfeast.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "غذای اصلی",
                        style: TextStyle(
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
