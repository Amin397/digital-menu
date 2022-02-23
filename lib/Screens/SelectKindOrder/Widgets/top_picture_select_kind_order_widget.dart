import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';

class TopPictureSelectKindOrder extends StatelessWidget {
  const TopPictureSelectKindOrder({Key? key, this.selectKindOrderController})
      : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return topPictureSelectKindOrder();
  }

  Widget topPictureSelectKindOrder() {
    return Stack(
      children: [
        SizedBox(
          height: Get.height * .13,
          width: Get.width,
          child: Hero(
            tag: 'image-tag',
            child: (Blocs.shop.shopModel!.image!.length > 10)
                ? Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      Blocs.shop.shopModel!.image!,
                    ),
                  )
                : const Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/shutterstock_282446912.0.0.png',
                    ),
                  ),
          ),
        ),
        Container(
          height: Get.height * .13,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.black45.withOpacity(.4),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .05,
          ),
          height: Get.height * .13,
          width: Get.width,
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              Blocs.shop.shopModel!.brandName.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
