import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class ShowSelectReservationDetailAlert extends StatelessWidget {
  const ShowSelectReservationDetailAlert({Key? key, this.controller})
      : super(key: key);
  final SelectKindOrderController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.height * .4,
        width: Get.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            const AutoSizeText(
              'لطفا اطلاعات مربوط به رزرو میز را تکمیل کنید',
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            _buildDate(),
            SizedBox(
              height: Get.height * .01,
            ),
            _buildStartTime(),
            SizedBox(
              height: Get.height * .01,
            ),
            _buildEndDescription(),
            SizedBox(
              height: Get.height * .01,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      controller!.reserveTable();
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height * .05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: (controller!.tableList!.singleWhere((
                            element) => element.isSelected.value).price == 0)
                            ? ColorUtils.green
                            : Colors.orange,
                      ),
                      child: Center(
                        child: AutoSizeText(
                            (controller!.tableList!.singleWhere((
                                element) => element.isSelected.value).price == 0)
                                ? 'رزرو میز'
                                : 'پرداخت بیعانه برای رزرو',
                          maxLines: 1,
                          maxFontSize: 18.0,
                          minFontSize: 14.0,
                          style: const TextStyle(
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

  Widget _buildDate() {
    return SizedBox(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  'تاریخ رزرو : ',
                  maxLines: 1,
                  maxFontSize: 14.0,
                  minFontSize: 10.0,
                  style: TextStyle(
                    color: ColorUtils.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller!.setDateAlert();
              },
              child: GetBuilder(
                init: controller,
                builder: (ctx) =>
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.lightBlue.shade900,
                          ),
                        ),
                      ),
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          (controller!.datePicked is Jalali)
                              ? controller!.datePicked!.year.toString() +
                              '/' +
                              controller!.datePicked!.month.toString() +
                              '/' +
                              controller!.datePicked!.day.toString()
                              : 'انتخاب تاریخ',
                          style: TextStyle(
                            color: (controller!.datePicked is Jalali)
                                ? Colors.black
                                : ColorUtils.grey,
                            fontSize:
                            (controller!.datePicked is Jalali) ? 16.0 : 12.0,
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStartTime() {
    return SizedBox(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  'ساعت شروع : ',
                  maxLines: 1,
                  maxFontSize: 14.0,
                  minFontSize: 10.0,
                  style: TextStyle(
                    color: ColorUtils.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller!.setStartTimeAlert();
              },
              child: GetBuilder(
                init: controller,
                builder: (ctx) =>
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.lightBlue.shade900,
                          ),
                        ),
                      ),
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          (controller!.startTimePicked is TimeOfDay)
                              ? controller!.startTimePicked!.hour.toString() +
                              ':' +
                              controller!.startTimePicked!.minute.toString()
                              : 'انتخاب ساعت شروع',
                          style: TextStyle(
                            color: (controller!.startTimePicked is TimeOfDay)
                                ? Colors.black
                                : ColorUtils.grey,
                            fontSize: (controller!.startTimePicked is TimeOfDay)
                                ? 16.0
                                : 12.0,
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEndDescription() {
    return SizedBox(
      width: Get.width,
      height: Get.height * .05,
      child: Row(
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  'ساعت پایان : ',
                  maxLines: 1,
                  maxFontSize: 14.0,
                  minFontSize: 10.0,
                  style: TextStyle(
                    color: ColorUtils.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller!.setEndTimeAlert();
              },
              child: GetBuilder(
                init: controller,
                builder: (ctx) =>
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.lightBlue.shade900,
                          ),
                        ),
                      ),
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          (controller!.endTimePicked is TimeOfDay)
                              ? controller!.hour.toString() +
                              ':' +
                              controller!.minute.toString()
                              : 'انتخاب ساعت پایانی',
                          style: TextStyle(
                            color: (controller!.endTimePicked is TimeOfDay)
                                ? Colors.black
                                : ColorUtils.grey,
                            fontSize: (controller!.endTimePicked is TimeOfDay)
                                ? 16.0
                                : 12.0,
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
