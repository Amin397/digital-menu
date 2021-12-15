import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/select_kind_order_controller/select_kind_order_controller.dart';

class BottomPictureSelectKindOrder extends StatelessWidget {
  const BottomPictureSelectKindOrder({Key? key, this.selectKindOrderController})
      : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return bottomPictureSelectKindOrder();
  }

  Widget bottomPictureSelectKindOrder() {
    return Column(
      children: [
        Container(
          height: Get.height * .13,
          width: Get.width,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/resrauantFirstPage.png',
            ),
          ),
        ),
        Container(
          height: Get.height * .02,
          width: Get.width,
        ),
      ],
    );
  }
}
