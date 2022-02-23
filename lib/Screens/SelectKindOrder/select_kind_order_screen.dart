import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';

import '../get_confirmation_dialog.dart';
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
    return WillPopScope(
      onWillPop: ()async{
        bool? canBack;

          canBack = await GetConfirmationDialog.show(
            text: "شما در حال خارج شدن از ${Blocs.shop.shopModel!.brandName} هستید",
          );

        if (canBack == true) {
          exit(0);
          // return true;
        }
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder(
            init: selectKindOrderController,
            builder: (ctx) {
              return StreamBuilder(
                stream: Blocs.shop.getStream,
                builder: (BuildContext context, i) {
                  return Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.white,
                    child: (Blocs.shop.shopModel is RestaurantModel)
                        ? Column(
                            children: [
                              TopPictureSelectKindOrder(
                                selectKindOrderController:
                                    selectKindOrderController,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: Get.height * .02,
                                      ),
                                      ButtonSelectKindOrder(
                                        selectKindOrderController:
                                            selectKindOrderController,
                                      ),
                                      const BottomPictureSelectKindOrder(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
