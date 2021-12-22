import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

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
        SizedBox(
          height: Get.height * .13,
          width: Get.width,
          child: const Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/resrauantFirstPage.png',
            ),
          ),
        ),
        SizedBox(
          height: Get.height * .02,
          width: Get.width,
        ),
      ],
    );
  }
}
