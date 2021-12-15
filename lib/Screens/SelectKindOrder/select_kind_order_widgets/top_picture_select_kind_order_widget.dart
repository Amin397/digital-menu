import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SelectKindOrder/select_kind_order_controller/select_kind_order_controller.dart';

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
          height: Get.height * .18,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                Get.height * .12,
              ),
              bottomLeft: Radius.circular(
                Get.height * .12,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                Get.height * .12,
              ),
              bottomLeft: Radius.circular(
                Get.height * .12,
              ),
            ),
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/shutterstock_282446912.0.0.png',
              ),
            ),
          ),
        ),
        Container(
          height: Get.height * .18,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                Get.height * .12,
              ),
              bottomLeft: Radius.circular(
                Get.height * .12,
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
              "رستوران ارکیده",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

}
