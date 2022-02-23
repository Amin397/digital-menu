import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/get_routs.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/MainModels/user_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/gatewey_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/reserved_table_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Widgets/final_detail_dialog.dart';
import 'package:untitled13/Screens/ShopingBasket/Widgets/reservation_table_code_alert.dart';
import 'package:untitled13/Screens/ShopingBasket/Widgets/reserved_table_detail_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class ShoppingBasketController extends GetxController {
  List<SingleProductModel> productList = [];
  var whichPage = Get.arguments;
  bool? countBox = false;

  ReservedTableModel? reservedTableModel;
  double dividerHeight = 0.0;
  TextEditingController reserveTextEditingController = TextEditingController();

  List<TableModel>? tableList = [];

  List<GatewayModel> gatewayList = [
    GatewayModel(
      id: 2,
      title: 'پرداخت آنلاین',
      isSelected: false,
    ),
    GatewayModel(
      id: 1,
      title: 'پرداخت نقدی',
      isSelected: false,
    ),
  ];

  int currentPage = 3;
  PageController? pageController;

  void changePage(page) {
    currentPage = page;

    update();
  }

  TextEditingController detailTextController = TextEditingController();

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 200), () {
      dividerHeight = Get.width;
      update();
    });
    pageController =
        PageController(viewportFraction: 1 / 5, initialPage: currentPage);
    super.onInit();
  }

  void getActiveTable() async {
    RequestHelper.makePostRequest(
        controller: 'ContractorTables',
        method: 'getTables',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
        }).then(
      (value) {
        if (value.isDone) {
          tableList = TableModel.listFromJson(value.data);
          update();
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
  }

  void showFinalDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: FinalDetailDialog(
          shoppingBasketController: this,
        ),
      ),
    );
  }

  void finalSubmit() async {
    EasyLoading.show();
    Map<String, dynamic> products = {};

    for (var o in Blocs.aminBasket.basket) {
      // Map<String, dynamic> map = {o.id.toString(): o.count};
      products[o.id.toString()] = o.count.value;
      // products.addEntries({o:map});
      // products.insert(0, map);
    }

    RequestHelper.makePostRequest(
      method: 'newOrderProducts',
      controller: 'Orders',
      body: (Blocs.user.user is UserModel)
          ? {
              'customerId': Blocs.user.user!.customerId.toString(),
              'orderPaymentId': gatewayList
                  .singleWhere((element) => element.isSelected!)
                  .id
                  .toString(),
              'urlAddress': Blocs.shop.shopModel!.urLaddress.toString(),
              'orderDetails': detailTextController.text,
              'productsPrice': Blocs.aminBasket.finalPrice.toString(),
              'order_type': '2',
              'table_id': Blocs.aminBasket.table!.id.toString(),
              'products': jsonEncode(products)
            }
          : {
              'orderPaymentId': gatewayList
                  .singleWhere((element) => element.isSelected!)
                  .id
                  .toString(),
              'urlAddress': Blocs.shop.shopModel!.urLaddress.toString(),
              'orderDetails': detailTextController.text,
              'productsPrice': Blocs.aminBasket.finalPrice.toString(),
              'order_type': '2',
              'table_id': Blocs.aminBasket.table!.id.toString(),
              'products': jsonEncode(products),
            },
    ).then((value) {
      EasyLoading.dismiss();
      if (value.isDone) {
        if (gatewayList.singleWhere((element) => element.isSelected!).id == 2) {
          launch(
            value.data['url'],
          );
        } else {
          Get.toNamed(NameRouts.successScreen);
        }
      } else {
        ViewHelper.errorSnackBar(
          message: 'خطایی رخ داد',
        );
      }
    });
  }

  void showReserveTableAlert() async {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: ReservationTableCodeAlert(controller: this),
      ),
    );
  }

  void getReservationCode() async {
    if (reserveTextEditingController.text.length == 6) {
      EasyLoading.show(
        status: 'در حال پردازش ...',
        maskType: EasyLoadingMaskType.black,
      );
      RequestHelper.makePostRequest(
          controller: 'Reservations',
          method: 'reservationInfo',
          body: {
            'code': reserveTextEditingController.text,
          }).then((value) {
        EasyLoading.dismiss();
        if (value.isDone) {
          reservedTableModel = ReservedTableModel.fromJson(value.data);
          showReservedTableDetail(
            reservedTableModel: reservedTableModel,
          );
        } else {
          ViewHelper.errorSnackBar(
            message: 'کد رزرو اشتباه است',
          );
          reserveTextEditingController.clear();
        }
      });
    } else {
      ViewHelper.errorSnackBar(
        message: 'کد رزرو 6 رقم میباشد',
      );
    }
  }

  void showReservedTableDetail({ReservedTableModel? reservedTableModel}) {
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: ReservedTableDetailAlert(
          reservedTableModel: reservedTableModel,
          controller: this,
        ),
      ),
    );
  }

  void checkTableDetail() {
    Blocs.aminBasket.setTable(
      tableModel: TableModel(
        isSelected: true.obs,
        name: reservedTableModel!.tableName,
        capacity: reservedTableModel!.tableCapacity,
        contractor: Blocs.shop.shopModel!.brandName,
        detail: reservedTableModel!.tableDetails,
        id: reservedTableModel!.tableId,
        number: reservedTableModel!.tableNumber,
        price: reservedTableModel!.tablePrice,
      ),
    );
    // Get.back();
  }
}
