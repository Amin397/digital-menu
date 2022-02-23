import 'dart:async';
import 'package:get/get.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/ProductList/Controller/product_list_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';

class CartBasket {
  final streamController = StreamController.broadcast();

  Stream get getStream => streamController.stream;

  List<InnerBasket> uniques = [];
  List<InnerBasket> basket = [];

  // void saveProduct(List<SingleProductModel> product) async{
  //   await StorageUtils.setProduct(product: product);
  // }
  // void setDataToList()async{
  //   products = await StorageUtils.getProduct();
  //   sync();
  // }

  void addToCart({required SingleProductModel model}) {
    uniques.clear();
    if (basket.isNotEmpty) {
      for (var o in basket) {
        if (o.categoryId == model.categoryId) {
          if (o.product!.contains(model)) {
            model.count++;
          } else {
            o.product!.add(model);
          }
          // for (var i in o.product!) {
          //   if (i.id == model.id) {
          //     model.count++;
          //   } else {
          //     uniques.add(
          //       InnerBasket(
          //         categoryId: model.categoryId,
          //         categoryName: model.categoryName,
          //         product: [model],
          //       ),
          //     );
          //   }
          // }
        } else {
          model.count++;
          uniques.add(
            InnerBasket(
              categoryId: model.categoryId,
              categoryName: model.categoryName,
              product: [
                model,
              ],
            ),
          );
        }
      }
    } else {
      model.count++;
      basket.add(
        InnerBasket(
          categoryId: model.categoryId,
          categoryName: model.categoryName,
          product: [
            model,
          ],
        ),
      );
    }
    sync();
  }

  void removeFromCart(SingleProductModel model) {
    if (basket.isNotEmpty) {
      for (var o in basket) {
        if (o.product!.length <= 1) {
          for (var i in o.product!) {
            if (i.id == model.id) {
              if (i.count < 1) {
                o.product!.remove(model);
              } else {
                i.count--;
              }
              print(i.count.toString());
            } else {
              o.product!.remove(model);
              // saveProduct(products);

            }
          }
        } else {
          basket.remove(
            InnerBasket(
              categoryId: model.categoryId,
              categoryName: model.categoryName,
              product: [
                model,
              ],
            ),
          );
        }
      }
    }
    sync();
  }

  int count(SingleProductModel products, index) {
    return basket
        .where((element) => element.product![index].id == products.id)
        .length;
  }

  void sync() {
    uniques.clear();
    List<int> usedIds = [];
    for (var element in basket) {
      if (!usedIds.contains(element.categoryId)) {
        uniques.add(element);
        usedIds.add(element.categoryId!);
      }
    }

    streamController.sink.add(uniques);
    streamController.sink.add(basket);
  }

  void removeAll() {
    basket.clear();
    // saveProduct(products);
    sync();
  }

//   void removeAllItems(SingleProductModel product) {
//     products.removeWhere((element) => element.id == product.id);
//     saveProduct(products);
//     sync();
//   }
//
//   void removeAllInGroup(int productGroupId) {
//     products.removeWhere((element) => element.groupId == productGroupId);
//     saveProduct(products);
//     sync();
//   }
//
//   double allPrices() {
//     double output = 0;
//     products.forEach((element) {
//       output += element.finalPrice;
//     });
//     return output;
//   }
//
//   double payPrice() {
//     return allPrices() - DiscountPriceBlocInstance.discountPrice;
//   }

}

class AminBasket {
  final streamController = StreamController.broadcast();

  TableModel? table;

  Stream get getStream => streamController.stream;

  List<ProductModel> uniques = [];
  List<ProductModel> basket = [];
  double finalPrice = 0.0;


  void setTable({TableModel? tableModel}){
    table = tableModel;
    Get.back();
    sync();
  }


  addToCart({
    required ProductModel item,
  }) {
    uniques.clear();
    if (basket.isNotEmpty) {
      if (basket.any((element) => element.id == item.id)) {
        item.count++;
        item.sumPrice =
            ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
        finalPrice = finalPrice + double.parse(item.price!);
      } else {
        basket.add(item);
        item.count++;
        item.sumPrice =
            ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
        finalPrice = finalPrice + double.parse(item.price!);
      }
      // for (var o in basket) {
      //   if (item.id == o.id) {
      //   } else {
      //     uniques.add(item);
      //
      //   }
      // }
    } else {
      basket.add(item);
      item.count++;
      item.sumPrice =
          ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
      finalPrice = finalPrice + double.parse(item.price!);
    }
    sync();
  }

  sync() {
    // basket.clear();
    // basket.addAll(uniques);
    // basket.addAll(uniques);
    print(basket.length);
    streamController.sink.add(uniques);
    streamController.sink.add(table);
    streamController.sink.add(basket);
    streamController.sink.add(finalPrice);
  }

  void removeFromBasket({
    ProductModel? item,
  }) {
    if (item!.count.value == 1) {
      basket.remove(item);
      item.count--;
      item.sumPrice =
          ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
      finalPrice = finalPrice - double.parse(item.price!);
    } else {
      item.count--;
      item.sumPrice =
          ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
      finalPrice = finalPrice - double.parse(item.price!);
    }
    sync();
  }

  void removeCompleteProduct({
    ProductModel? item,
  }) {
    basket.remove(item);
    finalPrice = finalPrice - (item!.count * double.parse(item.price!));
    item.count = 0.obs;
    item.sumPrice =
        ViewHelper.moneyFormat((item.count.value * (double.parse(item.price!))));
    sync();
  }

  void clearAllData() {
    basket.clear();
    finalPrice = 0.0;
    table = null;
    sync();
  }
}

class InnerBasket {
  int? categoryId;
  String? categoryName;
  List<SingleProductModel>? product;

  InnerBasket({this.categoryId, this.categoryName, this.product});
}
