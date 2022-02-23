import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class FinishedButtonRegister extends StatelessWidget {
  const FinishedButtonRegister({Key? key, this.registerController})
      : super(key: key);
  final RegisterController? registerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .06,
      width: Get.width * .8,
      child: Center(
        child: GetBuilder(
          init: registerController,
          builder: (_) => GestureDetector(
            onTap: () {
              registerController!.getCompeleteRegister();
            },
            child: Container(
              height: Get.height * .047,
              width: Get.width * .4,
              decoration: BoxDecoration(
                color: const Color(0xffE29805),
                borderRadius: BorderRadius.circular(
                  Get.height * .03,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: AutoSizeText(
                  "ورود",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
