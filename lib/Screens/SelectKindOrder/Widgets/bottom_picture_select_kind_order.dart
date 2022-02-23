import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class BottomPictureSelectKindOrder extends StatelessWidget {
  const BottomPictureSelectKindOrder({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomPictureSelectKindOrder();
  }
  Widget bottomPictureSelectKindOrder() {
    return SizedBox(
      height: Get.height * .1,
      width: Get.width,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/img.png',
        ),
      ),
    );
  }
}
