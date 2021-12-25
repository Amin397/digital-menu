import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
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
      height: Get.height * .4,
      width: Get.width,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: Get.height * .35,
              width: Get.width * .95,
              child: Hero(
                tag: 'image-tag',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Get.height * .015,
                  ),
                  child: (Blocs.shop.shopModel!.image!.length > 10)
                      ? Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            Blocs.shop.shopModel!.image!,
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .35,
              width: Get.width * .95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Get.height * .015,
                ),
                color: Colors.white30,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                bottom: Get.height * .04,
                right: Get.width * .025,
              ),
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
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.2),
                          Colors.black.withOpacity(.2),
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
                        Blocs.shop.shopModel!.brandName!,
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
                        child: (Blocs.shop.shopModel!.logo!.length > 10)
                            ? Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  Blocs.shop.shopModel!.logo!,
                                ),
                              )
                            : const Image(
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
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
