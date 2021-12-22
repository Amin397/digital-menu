import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Reserve%20table/Controller/reserve_table_controller.dart';

class FinishedButtonReserveTable extends StatelessWidget {
  const FinishedButtonReserveTable({Key? key, this.reserveTableController})
      : super(key: key);
  final ReserveTableController? reserveTableController;

  @override
  Widget build(BuildContext context) {
    return finishedButtonReserveTable();
  }

  Widget finishedButtonReserveTable() {
    return Container(
      height: Get.height * .07,
      width: Get.width,
      decoration: BoxDecoration(
        color: ColorUtils.mainRed,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Get.height * .07,
          ),
          topRight: Radius.circular(
            Get.height * .07,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
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
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (reserveTableController!.whichPage == 3) {
              Get.toNamed('/home', arguments: 3);
            }
          },
          child: Container(
            height: Get.height * .045,
            width: Get.width * .4,
            decoration: BoxDecoration(
              color: const Color(0xff49B728),
              borderRadius: BorderRadius.circular(Get.height * .03),
            ),
            child: const Center(
              child: AutoSizeText(
                "ثبت نهایی",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
