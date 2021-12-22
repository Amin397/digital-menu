import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/single_controller.dart';
import 'Widgets/appbar_single.dart';
import 'Widgets/category_foods_single_widgets.dart';
import 'Widgets/finished_button_single.dart';
import 'Widgets/sub_category_foods_single_widgets.dart';

class SingleScreen extends StatelessWidget {
  SingleScreen({Key? key}) : super(key: key);

  final SingleController singleController = Get.put(SingleController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Column(
                      children: [
                        AppBarSingle(singleController: singleController),

                        CategoryFoodsSingle(
                          singleController: singleController,
                        ),

                        SizedBox(
                          height: Get.height * .01,
                        ),

                        Container(
                          height: Get.height * .002,
                          width: Get.width,
                          color: Colors.black.withOpacity(.2),
                          margin:
                              EdgeInsets.symmetric(horizontal: Get.width * .08),
                        ),

                        SizedBox(
                          height: Get.height * .01,
                        ),

                        SubCategoryFoodsSingle(
                          singleController: singleController,
                        ),
                        // لیست
                      ],
                    ),
                  ),
                ),
                FinishedButtonSingle(
                  singleController: singleController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
