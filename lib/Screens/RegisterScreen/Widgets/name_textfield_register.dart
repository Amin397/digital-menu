import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class NameTextFieldRegister extends StatelessWidget {
  const NameTextFieldRegister({Key? key, this.registerController})
      : super(key: key);
  final RegisterController? registerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .06,
      child: Center(
        child: TextField(
          autofocus: false,
          controller: registerController!.nameTextFieldController,
          textAlign: TextAlign.right,
          enabled: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorUtils.mainDote,
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: "نام و نام خانوادگی",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorUtils.mainDote,
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          style: const TextStyle(
            color: Colors.black,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
