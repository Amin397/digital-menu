import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'end_order_controller/end_order_controller.dart';
import 'end_order_widgets/alert_end_order_widget.dart';

class EndOrderScreen extends StatelessWidget {
  final EndOrderController endOrderController = Get.put(EndOrderController());

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
                  child: AlertEndOrder(
                    endOrderController: endOrderController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
