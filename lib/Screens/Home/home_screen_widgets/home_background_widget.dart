import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/home_controller/home_controller.dart';
import 'package:untitled13/Screens/Home/home_screen_widgets/home_category_food.dart';
import 'home_app_bar_widget.dart';
import 'home_picture_widgets.dart';

class HomeBackgound extends StatelessWidget {
  const HomeBackgound({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homeBackgound();
  }

  Widget homeBackgound() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
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
          SizedBox(height: Get.height*.01,),
          HomeCategoryFood(
            homeController: homeController,
          ),
        ],
      ),
    );
  }
}
