import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Screens/RegisterScreen/register_controller/register_controller.dart';
import 'register_widgets/chose_adress_register.dart';
import 'register_widgets/finished_button_register.dart';
import 'register_widgets/mobile_number_textfield_register.dart';
import 'register_widgets/name_textfield_register.dart';
import 'register_widgets/top_part_of_register.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController registerController = Get.put(RegisterController());



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                    child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Color(0xffB72828),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopPartOfRegister(
                            registerController: registerController),
                        Container(
                          height: Get.height * .45,
                          width: Get.width * .8,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Container(
                                  height: Get.height * .06,
                                  width: Get.height * .5,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.transparent,
                                          height: double.maxFinite,
                                          width: double.maxFinite,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          height: double.maxFinite,
                                          width: double.maxFinite,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: Get.height *
                                                    .015,
                                                width: Get.width,
                                                color: Colors
                                                    .transparent,
                                              ),
                                              Container(
                                                height: Get.height *
                                                    .04,
                                                width: Get.width,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                      color: Colors
                                                          .white,
                                                    ),
                                                    AutoSizeText(
                                                      registerController.whichPage["mobileTextfieldController"].toString(),
                                                      style:
                                                      TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                        16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: Get.height *
                                                    .0015,
                                                width: Get.width,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                NameTextFieldRegister(
                                  registerController: registerController,
                                ),
                                PassWordTextFieldRegister(
                                  registerController: registerController,
                                ),
                                ChoseGenderRegister(
                                  registerController: registerController,
                                ),
                                FinishedButtonRegister(
                                  registerController: registerController,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: CustomClipPath2(),
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height * .1,
                                width: Get.width,
                                color: Colors.transparent,
                              ),
                              ClipPath(
                                clipper: CustomClipPath2(),
                                child: Container(
                                  height: Get.height * .076,
                                  width: Get.width,
                                  color: Colors.white.withOpacity(.3),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * .016),
                                child: ClipPath(
                                  clipper: CustomClipPath2(),
                                  child: Container(
                                    height: Get.height * .076,
                                    width: Get.width,
                                    // color: Color(0xffB72828).withOpacity(.5),
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * .032),
                                child: ClipPath(
                                  clipper: CustomClipPath2(),
                                  child: Container(
                                    height: Get.height * .076,
                                    width: Get.width,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Container(
                  height: Get.height * .14,
                  width: Get.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: Get.height * .12,
                      width: Get.width,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/LoginPicture.png',
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
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  Path getClip2(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 50);
    path.close();

    return path;
  }

  Path getClip2(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
