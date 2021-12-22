import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Controller/home_controller.dart';
import 'home_category_food.dart';
import 'home_picture_widgets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homeBackground();
  }

  Widget homeBackground() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          // HomeAppBar(
          //   homeController: homeController,
          // ),
          HomePicture(
            homeController: homeController,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          HomeCategoryFood(
            homeController: homeController,
          ),
        ],
      ),
    );
  }
}
