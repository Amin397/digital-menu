import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/end_order_controller.dart';
import 'Widgets/alert_end_order_widget.dart';

class EndOrderScreen extends StatelessWidget {
  final EndOrderController endOrderController = Get.put(EndOrderController());

  EndOrderScreen({Key? key}) : super(key: key);

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
