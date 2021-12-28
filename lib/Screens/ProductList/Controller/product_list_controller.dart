import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/FirstProductCategory/Model/single_model.dart';

class ProductListController extends GetxController {
  List<ProductModel> productList = [];
  RxBool isLoaded = false.obs;
  ProductCategoryModel? model;

  int? index = 0;

  @override
  void onInit() {
    model = Get.arguments['category'];
    index = Get.arguments['index'];
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'restProduct',
        body: {
          'urlAddress': Blocs.shop.shopModel!.urLaddress.toString(),
          'productName': model!.id.toString(),
        }).then(
      (value) {
        if (value.isDone) {
          productList = ProductModel.listFromJson(
            value.data,
          );
          isLoaded.value = true;
        } else {
          ViewHelper.errorSnackBar(
            message: 'خطایی رخ داد',
          );
        }
      },
    );
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
