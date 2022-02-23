import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/user_model.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class ButtonSelectKindOrder extends StatelessWidget {
  const ButtonSelectKindOrder({Key? key, this.selectKindOrderController})
      : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return backGroundReserveTable();
  }

  Widget backGroundReserveTable() {
    return Container(
      color: Colors.white,
      height: Get.height * .5,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (Blocs.shop.shopModel!.orderInResturant == 1)
              ? GestureDetector(
                  onTap: () {
                    selectKindOrderController!.pressInSideOrder();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: Get.height * .02),
                    height: Get.height * .09,
                    width: Get.width * .8,
                    decoration: BoxDecoration(
                      boxShadow: ViewHelper.shadow(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(12.0),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/images/inRest.png'),
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Center(
                              child: AutoSizeText(
                                "سفارش داخل رستوران",
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 14.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          (Blocs.shop.shopModel!.orderWithDelivery == 1)
              ? GestureDetector(
                  onTap: () {
                    selectKindOrderController!.pressOutSideOrder();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: Get.width * .2,
                      bottom: Get.height * .03,
                      top: Get.height * .03,
                    ),
                    height: Get.height * .09,
                    width: Get.width * .75,
                    decoration: BoxDecoration(
                      boxShadow: ViewHelper.shadow(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(12.0),
                            child: const Center(
                              child: Image(
                                image:
                                    AssetImage('assets/images/outOfRest.png'),
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Center(
                              child: AutoSizeText(
                                "سفارش بیرون بر",
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 14.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          (Blocs.shop.shopModel!.tableReservation == 1)
              ? GestureDetector(
                  onTap: () {
                    if (Blocs.user.user is UserModel) {
                      selectKindOrderController!.getActiveTable();
                    } else {
                      Get.toNamed('/loginscreen', arguments: 3);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    height: Get.height * .09,
                    width: Get.width * .8,
                    decoration: BoxDecoration(
                      boxShadow: ViewHelper.shadow(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(12.0),
                            child: const Center(
                              child: Image(
                                image:
                                    AssetImage('assets/images/reservation.png'),
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Center(
                              child: AutoSizeText(
                                "رزرو میز",
                                maxLines: 1,
                                maxFontSize: 18.0,
                                minFontSize: 14.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
