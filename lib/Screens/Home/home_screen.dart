import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/home_screen_widgets/home_background_widget.dart';
import 'package:untitled13/Screens/Single/single_screen.dart';
import 'HomeModel/home_model.dart';
import 'home_controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen( {Key? key}) : super(key: key);

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
                Expanded(
                  child: HomeBackgound(homeController: homeController,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





}
