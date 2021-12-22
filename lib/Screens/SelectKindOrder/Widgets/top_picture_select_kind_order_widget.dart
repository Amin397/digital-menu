import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Container(
          height: Get.height * .25,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                Get.height * .08,
              ),
              bottomLeft: Radius.circular(
                Get.height * .08,
              ),
            ),
          ),
          child: Hero(
            tag: 'image-tag',
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  Get.height * .08,
                ),
              ),
              child: (selectKindOrderController!.model!.image!.length > 10)
                  ? Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        selectKindOrderController!.model!.image!,
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
        ),
        Container(
          height: Get.height * .25,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(
                Get.height * .08,
              ),
            ),
            color: Colors.black45.withOpacity(.4),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: Get.height * .08),
            child: AutoSizeText(
              selectKindOrderController!.model!.brandName.toString(),
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
