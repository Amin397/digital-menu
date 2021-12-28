import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/FirstProductCategory/Widgets/finished_button_single.dart';
import 'package:untitled13/Screens/ProductList/Controller/product_list_controller.dart';

import 'Widgets/product_list_widget.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);
  ProductListController controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .05,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Hero(
                              tag: 'subCategory-${controller.index}',
                              child: ClipRRect(
                                child: (controller.model!.icon!.length > 10)
                                    ? Image(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            controller.model!.icon!),
                                      )
                                    : const Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/breackfeast.png',
                                        ),
                                      ),
                              ),
                            ),
                            height: Get.width * .09,
                            width: Get.width * .09,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Hero(
                            tag: 'name-${controller.index}',
                            child: Text(
                              controller.model!.name!,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              ProductListWidget(controller: controller,),
              const FinishedButtonSingle(),
            ],
          ),
        ),
      ),
    );
  }
}
