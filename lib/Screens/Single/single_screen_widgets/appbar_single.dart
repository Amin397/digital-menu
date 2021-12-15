import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Single/single_controller/single_controller.dart';

class AppBarSingle extends StatelessWidget {
  const AppBarSingle({Key? key, this.singleController}) : super(key: key);
  final SingleController? singleController;

  @override
  Widget build(BuildContext context) {
    return sppBarSingle();
  }

  Widget sppBarSingle() {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: Get.height * .06,
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.only(left: Get.width * .05),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff44E331),
          ),
        ),
      ),
    );
  }
}
