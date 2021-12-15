import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Reserve%20table/reserve_table_controller/reserve_table_controller.dart';
import 'modal_reserve_table_widget.dart';
import 'payment_reserve_table_widget.dart';
import 'select_date_time_reserve_table_widget.dart';

class BackGroundReserveTable extends StatelessWidget {
  const BackGroundReserveTable({Key? key, this.reserveTableController})
      : super(key: key);
  final ReserveTableController? reserveTableController;

  @override
  Widget build(BuildContext context) {
    return backGroundReserveTable();
  }

  Widget backGroundReserveTable() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            height: Get.height * .9,
            width: Get.width,
            color: Color(0xffB72828),

          ),

          Center(
            child: Container(
              height: Get.height * .5,
              width: Get.width * .9,
              color: Color(0xffB72828),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectDateTimeReserveTable(
                      reserveTableController: reserveTableController),
                  SelectModalNumberTableReserveTable(reserveTableController:reserveTableController),
                  PaymentReserveTable(reserveTableController:reserveTableController),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
