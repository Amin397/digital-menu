import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'Controller/reserve_table_controller.dart';
import 'Widgets/background_reserve_table.dart';
import 'Widgets/finished_button_reserve_table.dart';

class ReserveTable extends StatelessWidget {
  ReserveTable({Key? key}) : super(key: key);

  final ReserveTableController reserveTableController =
      Get.put(ReserveTableController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: ColorUtils.mainRed,
            child: Column(
              children: [
                Expanded(
                  child: BackGroundReserveTable(
                    reserveTableController: reserveTableController,
                  ),
                ),
                FinishedButtonReserveTable(
                  reserveTableController: reserveTableController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
