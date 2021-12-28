import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/SingleProduct/Controller/single_product_controller.dart';

class SingleProductScreen extends StatelessWidget {
  SingleProductScreen({Key? key}) : super(key: key);
  SingleProductController controller = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
        ),
      ),
    );
  }
}
