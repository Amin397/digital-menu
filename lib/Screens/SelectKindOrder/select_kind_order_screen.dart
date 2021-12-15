import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/select_kind_order_widgets/top_picture_select_kind_order_widget.dart';
import 'select_kind_order_controller/select_kind_order_controller.dart';
import 'select_kind_order_widgets/bottom_picture_select_kind_order.dart';
import 'select_kind_order_widgets/button_kind_order_widgets.dart';

class SelectKindOrderScreen extends StatelessWidget {
  SelectKindOrderScreen({Key? key}) : super(key: key);

  final SelectKindOrderController selectKindOrderController =
      Get.put(SelectKindOrderController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Color(0xffB72828),
            child: Column(
              children: [
                TopPictureSelectKindOrder(
                  selectKindOrderController: selectKindOrderController,
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Color(0xffB72828),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        ButtonSelectKindOrder(
                            selectKindOrderController:
                                selectKindOrderController),
                        BottomPictureSelectKindOrder(
                          selectKindOrderController: selectKindOrderController,
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
