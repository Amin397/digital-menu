import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Reserve%20table/Controller/reserve_table_controller.dart';

class PaymentReserveTable extends StatelessWidget {
  const PaymentReserveTable({Key? key, this.reserveTableController})
      : super(key: key);
  final ReserveTableController? reserveTableController;

  @override
  Widget build(BuildContext context) {
    return paymentReserveTable();
  }

  Widget paymentReserveTable() {
    return SizedBox(
      height: Get.height * .09,
      width: Get.width * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AutoSizeText(
                "مبلغ بیعانه:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Container(
                height: Get.height * .04,
                width: Get.width * .5,
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: Get.height * .03,
                      width: Get.width * .5,
                      child: const TextField(
                        autofocus: false,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hoverColor: Colors.white,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height * .0015,
                      width: 220,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const AutoSizeText(
                "تومان",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: Get.width * .05,
            ),
            child: const AutoSizeText(
              "حداقل 100,000 تومان",
              style: TextStyle(
                color: Color(0xffD4970A),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
