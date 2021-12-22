import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Controller/home_controller.dart';

class HomePicture extends StatelessWidget {
  const HomePicture({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homePicture();
  }

  Widget homePicture() {
    return Container(
      height: Get.height * .35,
      width: Get.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            Get.height * .01,
          ),
          bottomRight: Radius.circular(
            Get.height * .01,
          ),
        ),
      ),
      child: Stack(
        children: [
          Hero(
            tag: 'image-tag',
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  Get.height * .015,
                ),
                bottomRight: Radius.circular(
                  Get.height * .015,
                ),
              ),
              child: (homeController!.model!.image!.length > 10)
                  ? Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  homeController!.model!.image!,
                ),
              )
                  : const Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/shutterstock_282446912.0.0.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: Get.height * .04),
              height: Get.height * .06,
              width: Get.width * .49,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height * .05,
                    width: Get.width * .37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(.5),
                          Colors.white.withOpacity(.4),
                          Colors.white.withOpacity(.2),
                          Colors.white.withOpacity(.2),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Get.height * .01,
                        ),
                        bottomLeft: Radius.circular(
                          Get.height * .01,
                        ),
                      ),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        homeController!.model!.brandName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * .04,
                    width: Get.height * .05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.height * .008),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Get.height * .008),
                        child: (homeController!.model!.logo!.length > 10)?Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                          homeController!.model!.logo!,
                          ),
                        ): const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/aftabPicture.png',
                          ),
                        ),
                      ),
                      // SvgPicture.asset("assets/icons/IconAftab.svg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: (){

              },
            ),
          )
        ],
      ),
    );
  }
}
