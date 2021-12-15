import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/select_kind_order_controller/select_kind_order_controller.dart';

class ButtonSelectKindOrder extends StatelessWidget {
  const ButtonSelectKindOrder({Key? key, this.selectKindOrderController})
      : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return backGroundReserveTable();
  }

  Widget backGroundReserveTable() {
    return Container(
      height: Get.height * .5,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              selectKindOrderController!.pressInSideOrder();
            },
            child: Container(
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: Color(0xffE29805),
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Get.height * .02,
                  ),
                  bottomRight: Radius.circular(
                    Get.height * .02,
                  ),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  "سفارش داخل رستوران",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              selectKindOrderController!.pressOutSideOrder();

            },
            child: Container(
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: Color(0xffE29805),
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Get.height * .02,
                  ),
                  bottomLeft: Radius.circular(
                    Get.height * .02,
                  ),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  "سفارش بیرون بر",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              selectKindOrderController!.pressInSideReserveTableOrder();
            },
            child: Container(
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: Color(0xffE29805),
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Get.height * .02,
                  ),
                  bottomRight: Radius.circular(
                    Get.height * .02,
                  ),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  "رزرو میز",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
