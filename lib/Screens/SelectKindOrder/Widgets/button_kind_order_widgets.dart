import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class ButtonSelectKindOrder extends StatelessWidget {
  const ButtonSelectKindOrder({Key? key, this.selectKindOrderController})
      : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return backGroundReserveTable();
  }

  Widget backGroundReserveTable() {
    return SizedBox(
      height: Get.height * .5,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (selectKindOrderController!.model!.orderInResturant == 1)?GestureDetector(
            onTap: () {
              selectKindOrderController!.pressInSideOrder();
            },
            child: Container(
              margin: const EdgeInsets.all(12.0),
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: const Color(0xffE29805),
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
              child: const Center(
                child: AutoSizeText(
                  "سفارش داخل رستوران",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ):Container(),
          (selectKindOrderController!.model!.orderWithDelivery == 1)?GestureDetector(
            onTap: () {
              selectKindOrderController!.pressOutSideOrder();
            },
            child: Container(
              margin: const EdgeInsets.all(12.0),
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: const Color(0xffE29805),
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
              child: const Center(
                child: AutoSizeText(
                  "سفارش بیرون بر",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ):Container(),
          (selectKindOrderController!.model!.tableReservation == 1)?GestureDetector(
            onTap: () {
              selectKindOrderController!.pressInSideReserveTableOrder();
            },
            child: Container(
              margin: const EdgeInsets.all(12.0),
              height: Get.height * .14,
              width: Get.width * .65,
              decoration: BoxDecoration(
                border: Border.all(
                  width: Get.height * .01,
                  color: const Color(0xffE29805),
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
              child: const Center(
                child: AutoSizeText(
                  "رزرو میز",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
