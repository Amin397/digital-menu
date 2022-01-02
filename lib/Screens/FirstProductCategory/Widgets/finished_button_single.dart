import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/user_model.dart';
import 'package:untitled13/Screens/Alerts/LoginAlert/login_alert_dialog.dart';

class FinishedButtonSingle extends StatelessWidget {
  const FinishedButtonSingle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Blocs.aminBasket.getStream,
      builder: (BuildContext context, i) {
        return AnimatedContainer(
          // margin: EdgeInsets.symmetric(
          //   horizontal: Get.width * .02,
          // ),
          duration: const Duration(milliseconds: 270),
          height: (Blocs.aminBasket.basket.isNotEmpty) ? Get.height * .07 : 0.0,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                Get.height * .03,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 2,
                blurRadius: 3,
                // offset: const Offset(0, 3),
                offset: const Offset(
                  0.0,
                  -1.0,
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // if (productCategoryController!.whichPage == 1) {
                  // if(Blocs)
                  if(Blocs.user.user is UserModel){
                    Get.toNamed('/shopingBasket');
                  }else{
                    showLoginAlert();
                  }
                  // } else if (productCategoryController!.whichPage == 2) {
                  //   Get.toNamed('/shopingBasket', arguments: 2);
                  // } else if (productCategoryController!.whichPage == 3) {
                  //   Get.toNamed('/shopingBasket', arguments: 3);
                  // }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Get.width * .03,
                  ),
                  height: Get.height * .045,
                  width: Get.width * .4,
                  decoration: BoxDecoration(
                    color: const Color(0xff49B728),
                    borderRadius: BorderRadius.circular(Get.height * .03),
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      "مشاهده سبد خرید",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Get.width * .03,
                ),
                height: Get.height * .045,
                width: Get.width * .4,
                child: Row(
                  children: [
                    const Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Center(
                          child: AutoSizeText(
                            'مجموع قیمت:',
                            maxLines: 1,
                            maxFontSize: 14.0,
                            minFontSize: 8.0,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: Center(
                                  child: AutoSizeText(
                                    ViewHelper.moneyFormat(Blocs.aminBasket.finalPrice),
                                    maxLines: 1,
                                    maxFontSize: 22.0,
                                    minFontSize: 18.0,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: ColorUtils.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: Center(
                                  child: AutoSizeText(
                                    'تومان',
                                    maxLines: 1,
                                    maxFontSize: 14.0,
                                    minFontSize: 8.0,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: ColorUtils.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLoginAlert() async{
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: LoginAlertDialog(),
            backgroundColor: Colors.transparent,
          );
        }, context: Get.context!

    );
  }
}
