import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class NameTextFieldRegister extends StatelessWidget {
  const NameTextFieldRegister({Key? key, this.registerController})
      : super(key: key);
  final RegisterController? registerController;

  @override
  Widget build(BuildContext context) {
    return nameTextFieldRegister();
  }

  Widget nameTextFieldRegister() {
    return SizedBox(
      height: Get.height * .08,
      width: Get.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: Get.width * .08),
              child: const AutoSizeText(
                "نام و نام خانوادگی",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            height: Get.height * .05,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
            margin: EdgeInsets.symmetric(horizontal: Get.width * .06),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(Get.height * .032),
            ),
            child: TextField(
              autofocus: false,
              controller: registerController!.nameTextFieldController,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
