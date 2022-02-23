import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/reserved_table_model.dart';

class ReservedTableDetailAlert extends StatelessWidget {
  const ReservedTableDetailAlert({Key? key, this.reservedTableModel , this.controller})
      : super(key: key);
  final ReservedTableModel? reservedTableModel;
  final ShoppingBasketController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width,
        height: Get.height * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'میز رزرو شده ی شما',
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 14.0,
              ),
            ),
            const Divider(),
            _buildTableOptions(
              name: 'رزرو شده به نام :',
              value: reservedTableModel!.customerName,
            ),
            _buildTableOptions(
              name: 'شماره موبایل رزرو کننده :',
              value: reservedTableModel!.customerMobile,
            ),
            _buildTableOptions(
              name: 'تاریخ رزرو :',
              value: reservedTableModel!.date,
            ),
            _buildTableOptions(
              name: 'ساعت شروع رزرو :',
              value: reservedTableModel!.start,
            ),
            _buildTableOptions(
              name: 'ساعت پایان رزرو :',
              value: reservedTableModel!.end,
            ),
            _buildTableOptions(
              name: 'شماره میز رزرو شده:',
              value: reservedTableModel!.tableNumber.toString(),
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      controller!.checkTableDetail();
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height * .05,
                      decoration: BoxDecoration(
                        color: ColorUtils.green,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: ViewHelper.shadow(),
                      ),
                      child: const Center(
                        child: AutoSizeText(
                          'درسته',
                          maxLines: 1,
                          maxFontSize: 18.0,
                          minFontSize: 12.0,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTableOptions({String? name, String? value}) {
    return SizedBox(
      width: Get.width,
      height: Get.height * .04,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  name!,
                  style: const TextStyle(
                    color: ColorUtils.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  value!,
                  maxFontSize: 18.0,
                  maxLines: 2,
                  minFontSize: 12.0,
                  style: const TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
