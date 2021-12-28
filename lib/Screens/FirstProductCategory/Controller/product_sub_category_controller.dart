import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/FirstProductCategory/Model/single_model.dart';
import 'package:untitled13/Screens/Home/Model/contractor_sub_category_model.dart';

class ProductCategoryController extends GetxController {
  ContractorSubCategoryModel? model;
  List<List<ProductCategoryModel>> categoryList = [];
  List<List<ProductModel>> productList = [];
  RxBool isLoaded = false.obs;
  double dividerHeight = 0.0;
  int? index;

  @override
  void onInit() {
    model = Get.arguments['item'];
    index = Get.arguments['index'];
    pageController =
        PageController(viewportFraction: 1 / 4, initialPage: currentPage);
    getData(contractorSubCategoryId: model!.id.toString());
    super.onInit();
  }

  getData({String? contractorSubCategoryId}) async {
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'restProductCategory',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
          'contractorSubCategory': contractorSubCategoryId,
        }).then(
      (value) {
        if (value.isDone) {
          categoryList.add(ProductCategoryModel.listFromJson(
            value.data['categories'],
          ));
          productList.add(ProductModel.listFromJson(
            value.data['products'],
          ));
          isLoaded.value = true;
          Future.delayed(const Duration(milliseconds: 500), () {
            dividerHeight = Get.width * .95;
            update();
          });
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
  }

  int currentPage = 3;
  PageController? pageController;

  void changePage(page) {
    currentPage = page;

    update();
  }

  void nextApi({ProductCategoryModel? item}) {
    dividerHeight = 0.0;
    isLoaded.value = false;
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'restProductSubCategory',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
          'productCategory': item!.id.toString(),
        }).then(
      (value) {
        if (value.isDone) {
          categoryList.add(ProductCategoryModel.listFromJson(
            value.data['categories'],
          ));
          productList.add(ProductModel.listFromJson(
            value.data['products'],
          ));
          isLoaded.value = true;
          Future.delayed(const Duration(milliseconds: 500), () {
            dividerHeight = Get.width * .95;
            update();
          });
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
  }
  void secondApi({ProductCategoryModel? item}) {
    dividerHeight = 0.0;
    isLoaded.value = false;
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'restProductName',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
          'productSubCategory': item!.id.toString(),
        }).then(
      (value) {
        if (value.isDone) {
          categoryList.add(ProductCategoryModel.listFromJson(
            value.data['categories'],
          ));
          productList.add(ProductModel.listFromJson(
            value.data['products'],
          ));
          isLoaded.value = true;
          Future.delayed(const Duration(milliseconds: 500), () {
            dividerHeight = Get.width * .95;
            update();
          });
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
  }

  void goBack() {
    if (categoryList.length == 1) {
      Get.back();
    } else {
      update();
      categoryList.removeLast();
      productList.removeLast();
      refresh();
    }
  }

  void removeAll({ProductModel? item}) {
    Blocs.aminBasket.removeCompleteProduct(
      item: item,
    );
    update();
  }

  void removeItem({ProductModel? item}) {
    Blocs.aminBasket.removeFromBasket(
      item: item,
    );
    update();
  }

  void addItem({ProductModel? item}) {
    Blocs.aminBasket.addToCart(
      item: item!,
    );
    update();
  }
}
