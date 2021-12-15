import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Reserve%20table/reserve_table_controller/reserve_table_controller.dart';

class PaymentReserveTable extends StatelessWidget {
  const PaymentReserveTable({Key? key, this.reserveTableController})
      : super(key: key);
  final ReserveTableController? reserveTableController;

  @override
  Widget build(BuildContext context) {
    return paymentReserveTable();
  }

  Widget paymentReserveTable() {
    return Container(
      height: Get.height * .09,
      width: Get.width * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                "مبلغ بیعانه:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Container(
                height: Get.height * .04,
                width: Get.width * .5,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height * .03,
                      width: Get.width * .5,

                      child: TextField(
                        autofocus: false,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hoverColor: Colors.black,
                          fillColor: Colors.black,
                          focusColor: Colors.black,
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
              AutoSizeText(
                "تومان",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: Get.width * .05),
            child: AutoSizeText(
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
