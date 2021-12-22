import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';

import 'Controller/select_kind_order_controller.dart';
import 'Model/restaurant_model.dart';
import 'Widgets/bottom_picture_select_kind_order.dart';
import 'Widgets/button_kind_order_widgets.dart';
import 'Widgets/top_picture_select_kind_order_widget.dart';

class SelectKindOrderScreen extends StatelessWidget {
  SelectKindOrderScreen({Key? key}) : super(key: key);

  final SelectKindOrderController selectKindOrderController =
      Get.put(SelectKindOrderController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder(
          init: selectKindOrderController,
          builder: (ctx) {
        return Container(
          height: Get.height,
          width: Get.width,
          color: ColorUtils.mainRed,
          child: (selectKindOrderController.model is RestaurantModel)
              ? Column(
                  children: [
                    TopPictureSelectKindOrder(
                      selectKindOrderController: selectKindOrderController,
                    ),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: ColorUtils.mainRed,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            ButtonSelectKindOrder(
                              selectKindOrderController:
                                  selectKindOrderController,
                            ),
                            BottomPictureSelectKindOrder(
                              selectKindOrderController:
                                  selectKindOrderController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
          },
        ),
      ),
    );
  }
}
