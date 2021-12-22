import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/EndOrder/Controller/end_order_controller.dart';
import 'package:untitled13/Screens/Home/home_screen.dart';

class AlertEndOrder extends StatelessWidget {
  const AlertEndOrder({Key? key, this.endOrderController}) : super(key: key);
  final EndOrderController? endOrderController;

  @override
  Widget build(BuildContext context) {
    return alertEndOrder();
  }

  Widget alertEndOrder() {
    return Center(
      child: Container(
        height: Get.height * .8,
        width: Get.width,
        padding: EdgeInsets.only(left: Get.width * .05),
        child: Center(
          child: AlertDialog(
            title: const Text(
              "پایان عملیات سفارش",
            ),
            content: const Text(
              "سفارش شما با موفقیت ثبت شد . از سفارش شما ممنونیم.",
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    HomeScreen(),
                  );
                },
                child: Container(
                  color: const Color(0xffE29805),
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: AutoSizeText(
                      "پایان عملیات",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
