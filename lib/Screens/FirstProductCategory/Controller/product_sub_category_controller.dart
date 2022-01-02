import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/FirstProductCategory/Model/single_model.dart';

class ProductCategoryController extends GetxController {
  List<ProductCategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<ProductModel> showProductList = [];
  RxBool isLoaded = false.obs;
  double dividerHeight = 0.0;

  int page = 1;



  @override
  void onInit() {
    pageController =
        PageController(viewportFraction: 1 / 4, initialPage: currentPage);

    getData();
    super.onInit();
  }

  getData() async {
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'restContractorCategories',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress,
        }).then(
      (value) {
        if (value.isDone) {


          categoryList = ProductCategoryModel.listFromJson(
            value.data['categories'],
          );
          productList = ProductModel.listFromJson(
            value.data['products'],
          );

          showProductList.addAll(productList);

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
    print(item!.isSelected);
    print(item.id);
    if (item.isSelected!) {
      item.isSelected = false;
      if (categoryList.length == 2) {
        update();
        categoryList.removeLast();
        productList.removeLast();
        refresh();
      } else {
        // update();
        // categoryList.removeLast();
        // categoryList.removeLast();
        // productList.removeLast();
        // productList.removeLast();
        // refresh();
      }
    } else {
      EasyLoading.show();
      categoryList.forEach((element) {
        element.isSelected = false;
      });

      RequestHelper.makePostRequest(
          controller: 'Contractors',
          method: 'restFilterProducts',
          body: {
            'urlAddress': Blocs.shop.shopModel!.urLaddress,
            'contractorProductCategoryId': item.id.toString(),
            'page':page.toString(),
          }).then(
        (value) {
          if(value.data['hasNext']){
            page ++ ;
          }
          if (value.isDone) {
            categoryList = ProductCategoryModel.listFromJson(
              value.data['categories'],
            );
            productList = ProductModel.listFromJson(
              value.data['products'],
            );
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
  }

  void secondApi({ProductCategoryModel? item}) {
    if (item!.isSelected!) {
    } else {
      categoryList.forEach((element) {
        element.isSelected = false;
      });
      item.isSelected = true;
      dividerHeight = 0.0;
      RequestHelper.makePostRequest(
          controller: 'Contractors',
          method: 'restProduct',
          body: {
            'urlAddress': Blocs.shop.shopModel!.urLaddress,
            'productName': item.id.toString(),
          }).then(
        (value) {
          if (value.isDone) {
            // categoryList.add(ProductCategoryModel.listFromJson(
            //   value.data['categories'],
            // ));
            productList = ProductModel.listFromJson(
              value.data['products'],
            );
            isLoaded.value = true;
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                dividerHeight = Get.width * .95;
                update();
              },
            );
          } else {
            ViewHelper.errorSnackBar(
              message: 'خطایی رخ داد',
            );
          }
        },
      );
    }
  }

  void goBack() {
    Get.back();
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

  void filterProduct({ProductCategoryModel? item}) {
    if (item!.isSelected!) {
      showProductList.clear();
      showProductList.addAll(productList);
      item.isSelected = false;
    } else {
      for (var o in categoryList) {
        o.isSelected = false;
      }
      item.isSelected = true;
      showProductList.clear();
      for (var o in productList) {
        if (item.id == o.contractorProductCategoryId) {
          showProductList.insert(0, o);
        }
      }
    }
      update();
  }
}
