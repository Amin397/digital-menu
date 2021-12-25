import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Controller/home_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homeAppBar();
  }

  Widget homeAppBar() {
    return GestureDetector(
      onTap: () {
        // if (homeController!.whichPage == 1) {
          Get.back();
        // } else if (homeController!.whichPage == 3) {
        //   Get.back();
        // }
      },
      child: Container(
        height: Get.height * .06,
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.only(
          left: Get.width * .05,
        ),
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
