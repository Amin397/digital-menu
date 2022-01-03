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
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Widgets/final_detail_dialog.dart';

class ShoppingBasketController extends GetxController {
  List<SingleProductModel> productList = [];
  var whichPage = Get.arguments;
  bool? countBox = false;

  double dividerHeight = 0.0;

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
    List<Map<String, dynamic>> products = [];

    for (var o in Blocs.aminBasket.basket) {
      Map<String, dynamic> map = {o.id.toString(): o.count};
      products.insert(0, map);
    }

    RequestHelper.makePostRequest(
      method: 'newOrderProducts',
      controller: 'Orders',
      body: (Blocs.user.user is UserModel)
          ? {
              'customerId': Blocs.user.user!.id.toString(),
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
              'products': jsonEncode(products)
            },
    ).then((value) {
      EasyLoading.dismiss();
      if (value.isDone) {
        Get.toNamed(NameRouts.successScreen);
      } else {
        ViewHelper.errorSnackBar(
          message: 'خطایی رخ داد',
        );
      }
    });
  }
}
