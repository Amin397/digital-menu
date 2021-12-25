import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/home_controller.dart';
import 'Widgets/home_category_food.dart';
import 'Widgets/home_picture_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: Column(
              children: [
                // HomeAppBar(
                //   homeController: homeController,
                // ),
                HomePicture(
                  homeController: homeController,
                ),
                SizedBox(
                  height: Get.height * .005,
                ),
                HomeCategoryFood(
                  homeController: homeController,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
