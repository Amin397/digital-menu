import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class LastNameTextFieldRegister extends StatelessWidget {
  const LastNameTextFieldRegister({Key? key, this.registerController})
      : super(key: key);
  final RegisterController? registerController;

  @override
  Widget build(BuildContext context) {
    return lastNameTextFieldRegister();
  }

  Widget lastNameTextFieldRegister() {
    return SizedBox(
      height: Get.height * .08,
      width: Get.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: Get.width * .08,
              ),
              child: const AutoSizeText(
                "نام خانوادگی",
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
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * .04,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: Get.width * .06,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(
                Get.height * .032,
              ),
            ),
            child: const TextField(
              autofocus: false,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
