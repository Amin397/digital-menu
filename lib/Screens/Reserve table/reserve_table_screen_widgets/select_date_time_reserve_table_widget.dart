import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Reserve%20table/reserve_table_controller/reserve_table_controller.dart';

class SelectDateTimeReserveTable extends StatelessWidget {
  const SelectDateTimeReserveTable({Key? key, this.reserveTableController})
      : super(key: key);
  final ReserveTableController? reserveTableController;

  @override
  Widget build(BuildContext context) {
    return selectDateTimeReserveTable();
  }

  Widget selectDateTimeReserveTable() {
    return Container(
      height: Get.height * .2,
      width: Get.width * .9,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            "رزرو میز",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.height * .052,
                width: Get.width * .33,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(.1),
                  borderRadius: BorderRadius.circular(Get.height * .009),
                  border: Border.all(
                    width: 3.3,
                    color: Color(0xffD4970A),
                  ),
                ),
                padding: EdgeInsets.only(right: Get.width * .05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      "انتخاب روز",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Color(0xffD4970A),
                      size: 30,
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * .052,
                width: Get.width * .33,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(.1),
                  borderRadius: BorderRadius.circular(Get.height * .009),
                  border: Border.all(
                    width: 3.3,
                    color: Color(0xffD4970A),
                  ),
                ),
                padding: EdgeInsets.only(right: Get.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      "انتخاب ساعت",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Color(0xffD4970A),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
