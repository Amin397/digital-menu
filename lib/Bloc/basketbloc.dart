import 'dart:async';
import 'package:untitled13/MainModels/prduct_model.dart';
import 'package:untitled13/MainModels/product_model.dart';
import 'package:untitled13/Screens/ProductList/Controller/product_list_controller.dart';

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

  Stream get getStream => streamController.stream;

  List<ProductModel> uniques = [];
  List<ProductModel> basket = [];

  addToCart({required ProductModel item,}) {
    uniques.clear();
    if (basket.isNotEmpty) {
      for (var o in basket) {
        if (item.id == o.id) {
          item.count++;
        } else {
          uniques.add(item);
          item.count++;
        }
      }
    } else {
      basket.add(item);
      item.count++;
    }
    sync();
  }

  sync() {
    streamController.sink.add(uniques);
    streamController.sink.add(basket);
  }

  void removeFromBasket({
    ProductModel? item,
  }) {
    if (item!.count == 1) {
      basket.remove(item);
      item.count--;
    } else {
      item.count--;
    }
    sync();
  }

  void removeCompleteProduct(
      {ProductModel? item, ProductListController? controller}) {
    basket.remove(item);
    item!.count = 0;
    sync();
  }
}

class InnerBasket {
  int? categoryId;
  String? categoryName;
  List<SingleProductModel>? product;

  InnerBasket({this.categoryId, this.categoryName, this.product});
}
