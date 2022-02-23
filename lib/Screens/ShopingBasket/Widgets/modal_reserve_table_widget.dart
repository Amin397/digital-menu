import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Screens/ShopingBasket/Controller/shoping_basket_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';
import 'package:untitled13/Screens/ShopingBasket/Widgets/reserv_table_modal.dart';

class ModalReserveTableShoppingBasket extends StatelessWidget {
  final ShoppingBasketController? shoppingBasketController;

  const ModalReserveTableShoppingBasket(
      {Key? key, this.shoppingBasketController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            shoppingBasketController!.getActiveTable();
            showTableModal();
          },
          child: StreamBuilder(
            stream: Blocs.aminBasket.getStream,
            builder: (BuildContext context, i) => Container(
              height: Get.height * .05,
              width: Get.width * .4,
              padding: EdgeInsets.only(right: Get.width * .05),
              child: Row(
                children: [
                  AutoSizeText(
                    (Blocs.aminBasket.table is TableModel)
                        ? 'میز شماره :' +
                            Blocs.aminBasket.table!.number.toString()
                        : "انتخاب میز",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color(0xffD4970A),
                borderRadius: BorderRadius.circular(Get.height * .008),
              ),
            ),
          ),
        ),
        SizedBox(
          width: Get.width * .05,
        ),
        TextButton(
          child: const Text(
            'میز رزرو شده دارم',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          onPressed: () {
            shoppingBasketController!.showReserveTableAlert();
          },
        ),
      ],
    );
  }

  showTableModal() {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReserveTableModal(
          shoppingBasketController: shoppingBasketController,
        );
      },
    );
  }
}
