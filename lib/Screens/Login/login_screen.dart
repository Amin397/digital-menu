import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/widgets/login_field.dart';
import 'package:untitled13/Screens/Login/widgets/pincode_field.dart';
import 'package:untitled13/Screens/Login/widgets/top_part_login_screen.dart';
import 'controller/login_controller_amin_khademi.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
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
                      color: ColorUtils.mainRed,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopPartLoginScreen(
                            loginController: loginController,
                          ),
                          SizedBox(
                            height: Get.height * .42,
                            width: Get.width * .8,
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              controller: loginController.pageViewController,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: Get.height * .3,
                                    width: Get.width * .8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: Get.height * .1,
                                          width: Get.width * .8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Align(
                                                alignment: Alignment.center,
                                                child: AutoSizeText(
                                                  "شماره موبایل خود را وارد کنید",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: Get.height * .05,
                                                width: Get.width,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: Get.width * .04,
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: Get.width * .06,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Get.height * .032,
                                                  ),
                                                ),
                                                child: TextField(
                                                  autofocus: false,
                                                  controller: loginController
                                                      .mobileTextfieldController,
                                                  textAlign: TextAlign.left,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                      11,
                                                    ),
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        " 000 000 000 +98",
                                                    hintStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * .1,
                                          width: Get.width * .8,
                                          child: Center(
                                            child: GetBuilder(
                                              init: loginController,
                                              builder: (_) => GestureDetector(
                                                onTap: () {
                                                  if (loginController
                                                          .whichPage ==
                                                      2) {
                                                    // 2 && loginController.mobileTextfieldController) {
                                                    loginController
                                                        .getLoginAPI();
                                                  } else if (loginController
                                                          .whichPage ==
                                                      3) {
                                                    loginController
                                                        .getLoginAPI();
                                                  }
                                                },
                                                child: Container(
                                                  height: Get.height * .047,
                                                  width: Get.width * .4,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE29805),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Get.height * .03,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(.2),
                                                        spreadRadius: 2,
                                                        blurRadius: 3,
                                                        offset:
                                                            const Offset(0, 3),
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Center(
                                                    child: AutoSizeText(
                                                      "ورود",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                PassWordLoginField(
                                  loginController: loginController,
                                ),
                                PinCodeLoginField(
                                  loginController: loginController,
                                ),
                              ],
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
                                  padding: EdgeInsets.only(
                                    top: Get.height * .016,
                                  ),
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
                                  padding: EdgeInsets.only(
                                    top: Get.height * .032,
                                  ),
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
                  ),
                ),
                bottomPictureLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomPictureLogin() {
    return SizedBox(
      height: Get.height * .14,
      width: Get.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: Get.height * .12,
          width: Get.width,
          child: const Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/LoginPicture.png',
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
