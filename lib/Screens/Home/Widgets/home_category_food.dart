import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/Home/Controller/home_controller.dart';
import 'package:untitled13/Screens/Home/Model/home_model.dart';

class HomeCategoryFood extends StatelessWidget {
  const HomeCategoryFood({Key? key, this.homeController}) : super(key: key);
  final HomeController? homeController;

  @override
  Widget build(BuildContext context) {
    return homeCategoryFood();
  }

  Widget homeCategoryFood() {
    return Container(
      margin: EdgeInsets.only(
        top: Get.height * .035,
      ),
      height: Get.height * .55,
      width: Get.width * .9,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 3 / 3.5,),
        scrollDirection: Axis.vertical,
        itemCount: homeController!.cardsList.length,
        itemBuilder: (context, index) => _buildCardsViewItem(
          item: homeController!.cardsList[index],
          index: index,
        ),
      ),
    );
  }

  Widget _buildCardsViewItem({CardsModel? item, int? index,}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .015,
        vertical: Get.width * .018,
      ),
      child: GetBuilder(
        init: homeController,
        builder: (_) => Center(
          child: GestureDetector(
            onTap: () {
              homeController!.nextPage();
            },
            child: Container(
              height: Get.height,
              width: Get.width,
              margin: const EdgeInsets.only(
                top: 08,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Get.height * .008),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.4),
                    spreadRadius: 2,
                    blurRadius: 3,
                    // offset: const Offset(0, 3),
                    offset: const Offset(
                      0.0,
                      1.0,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: Get.height * .01),
                  const Flexible(
                    flex: 8,
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: ClipRRect(
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/breackfeast.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 4,
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "غذای اصلی",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
