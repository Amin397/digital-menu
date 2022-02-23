import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/get_routs.dart';
import 'package:untitled13/Screens/SelectKindOrder/Widgets/reserve_table_modal_from_main.dart';
import 'package:untitled13/Screens/SelectKindOrder/Widgets/show_select_reservation_detail_alert.dart';
import 'package:untitled13/Screens/SelectKindOrder/Widgets/show_success_reserve_alert.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SelectKindOrderController extends GetxController {
  bool? hasLogin;

  Jalali? datePicked;
  TimeOfDay? startTimePicked;
  TimeOfDay? endTimePicked;
  int hour = 0;
  int minute = 00;

  pressInSideOrder() async {
    hasLogin = false;
    if (hasLogin == false) {
      Blocs.shop.selectPageNumber(1);
      Get.toNamed(
        NameRouts.productCategoryScreen,
      );
      // Get.toNamed('/home');
    }
  }

  int currentPage = 3;
  PageController? pageController;

  void changePage(page) {
    currentPage = page;

    update();
  }

  pressOutSideOrder() async {
    hasLogin = true;
    if (hasLogin == true) {
      Get.toNamed('/loginscreen', arguments: 2);
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      viewportFraction: 1 / 5,
      initialPage: currentPage,
    );
    getUserData();
  }

  getUserData() async {
    final box = GetStorage();
    final mobile = box.read('userMobile');
    if (mobile is String) {
      RequestHelper.makePostRequest(
        body: {
          'mobile': mobile,
        },
        controller: 'Customers',
        method: 'customerInfo',
      ).then(
        (value) {
          if (value.isDone) {
            Blocs.user.setData(
              json: value.data,
            );
          }
        },
      );
    }
    if(!kIsWeb){
      getRestaurantData();
    }
  }

  void getActiveTable() async {
    EasyLoading.show(
      status: 'در حال پردازش ...',
      maskType: EasyLoadingMaskType.black,
    );
    RequestHelper.makePostRequest(
        controller: 'ContractorTables',
        method: 'getTables',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
        }).then(
      (value) {
        EasyLoading.dismiss();
        if (value.isDone) {
          tableList = TableModel.listFromJson(value.data);
          update();
          print(tableList!.length);
          showTableModal();
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
  }

  List<TableModel>? tableList = [];

  showTableModal() {
    showModalBottomSheet(
      enableDrag: false,
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReserveTableModalFromMain(
          selectKindOrderController: this,
        );
      },
    );
  }

  void getRestaurantData() async {
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'singleContractor',
        body: {
          'contractorUrlAddress': '79f7d8ba1f2e747286c5e4cb1cdd9eb4',
        }).then((value) {
      if (value.isDone) {
        Blocs.shop.getData(
          value.data,
        );
      } else {
        ViewHelper.errorSnackBar(
          message: 'خطایی رخ داد',
        );
      }
      update();
    });
  }

  void selectTableForReserve({
    TableModel? item,
  }) {
    tableList!.map((e) {
      e.isSelected.value = false;
    }).toList();
    item!.isSelected.value = true;
  }

  setDateAlert() async {
    datePicked = await showPersianDatePicker(
        context: Get.context!,
        initialDate: Jalali.now(),
        firstDate: Jalali.now(),
        lastDate: Jalali(1450, 9),
        useRootNavigator: false);
    update();

    // var label = timePicked!.persianFormat(Get.context!,);
    // print(timePicked);
  }

  setStartTimeAlert() async {
    startTimePicked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      cancelText: 'لغو',
      confirmText: 'تایید',
    );
    update();
  }

  setEndTimeAlert() async {
    endTimePicked = await showTimePicker(
      context: Get.context!,
      initialTime: startTimePicked!,
      cancelText: 'لغو',
      confirmText: 'تایید',
    );

    hour = endTimePicked!.hour;
    minute = endTimePicked!.minute;

      minute = minute + Blocs.shop.shopModel!.reservationTime!;
      if(minute >= 60){
        hour ++ ;
        minute = minute - 60;
      }
      // if (minute > Blocs.shop.shopModel!.reservationTime!) {
      //   if ((2 * Blocs.shop.shopModel!.reservationTime!) >= 60) {
      //     hour++;
      //     minute = 0;
      //   } else {
      //     minute = (2 * Blocs.shop.shopModel!.reservationTime!);
      //   }
      // } else {
      //   minute = Blocs.shop.shopModel!.reservationTime!;
      //   // hour ++ ;
      // }

    update();
  }

  void showSelectTimeAlert() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: ShowSelectReservationDetailAlert(controller: this),
      ),
    );
  }

  void reserveTable() async {
    if (datePicked is Jalali) {
      if (startTimePicked is TimeOfDay) {
        if (endTimePicked is TimeOfDay) {
          // print(datePicked!.toDateTime().toString().replaceAll('00:00:00.000', '').replaceAll('-', '/'));
          // DateTime amin = DateTime(datePicked!.year , datePicked!.month , datePicked!.day , 0 , 0 , 0);
          // print(amin);
          sendReserveRequest();
        } else {
          ViewHelper.errorSnackBar(
            message: 'ابتدا باید ساعت پایانی رزرو خود را انتخاب کنید',
          );
        }
      } else {
        ViewHelper.errorSnackBar(
          message: 'ابتدا باید ساعت شروع رزرو خود را انتخاب کنید',
        );
      }
    } else {
      ViewHelper.errorSnackBar(
        message: 'ابتدا باید تاریخ رزرو خود را انتخاب کنید',
      );
    }
  }

  void sendReserveRequest() async {
    EasyLoading.show(
      status: 'در حال پردازش ...',
      maskType: EasyLoadingMaskType.black,
    );
    RequestHelper.makePostRequest(
        method: 'tableReservation',
        controller: 'Reservations',
        body: {
          'reservationStart':
              '${startTimePicked!.hour}:${startTimePicked!.minute}',
          // 'urlAddress': Blocs.shop.shopModel!.urLaddress.toString(),
          'customerId': Blocs.user.user!.customerId.toString(),
          'contractorTableId': tableList!
              .singleWhere((element) => element.isSelected.value)
              .id
              .toString(),
          'reservationDate':datePicked!.toDateTime().toString().replaceAll('00:00:00.000', '').replaceAll('-', '/'),
              // '${datePicked!.year}/${datePicked!.minute}/${datePicked!.day}',
          'reservationEnd': '$hour:$minute'
        }).then(
      (value) {
        EasyLoading.dismiss();
        if (value.isDone) {
          print(value.data);
          if (tableList!
                  .singleWhere((element) => element.isSelected.value)
                  .price ==
              0) {
            showSuccessAlert(
              code: value.data['code'].toString(),
            );
          } else {
            launch(value.data['url']);
          }
        }
      },
    );
  }

  showSuccessAlert({
    String? code,
  }) async {
    Get.back();
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: ShowSuccessReserveAlert(
          controller: this,
          reservationCode: code,
        ),
      ),
    );
  }
}
