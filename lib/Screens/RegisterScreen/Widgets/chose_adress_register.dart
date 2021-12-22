import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class ChoseGenderRegister extends StatelessWidget {
  const ChoseGenderRegister({Key? key, this.registerController})
      : super(key: key);
  final RegisterController? registerController;

  @override
  Widget build(BuildContext context) {
    return choseGenderRegister();
  }

  Widget choseGenderRegister() {
    return GetBuilder(
      init: registerController,
      builder: (_) => SizedBox(
        height: Get.height * .06,
        width: Get.width * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: Get.width * .08),
                child: const AutoSizeText(
                  "جنسیت",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .03,
              width: Get.width * .3,
              child: Center(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: registerController!.gendersList.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      height: Get.height * .03,
                      width: Get.width * .14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                registerController!.genderSelected(index);
                              },
                              child: AnimatedContainer(
                                height: Get.height * .02,
                                width: Get.height * .02,
                                decoration: BoxDecoration(
                                  color: (registerController!
                                          .gendersList[index].isGender!)
                                      ? const Color(0xffE29805)
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius:
                                      BorderRadius.circular(Get.height * .032),
                                ),
                                duration: const Duration(milliseconds: 300),
                              )),
                          AutoSizeText(
                            registerController!.gendersList[index].genderName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
