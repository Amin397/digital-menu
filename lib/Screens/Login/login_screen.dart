import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/Login/widgets/complete_register_filed.dart';
import 'package:untitled13/Screens/Login/widgets/enter_mobile_number_field.dart';
import 'package:untitled13/Screens/Login/widgets/login_field.dart';
import 'package:untitled13/Screens/Login/widgets/pincode_field.dart';
import 'package:untitled13/Screens/Login/widgets/top_part_login_screen.dart';
import 'controller/login_controller_amin_khademi.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  final LoginController loginController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              Expanded(
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopPartLoginScreen(
                          loginController: loginController,
                        ),
                        SizedBox(
                          height: Get.height * .5,
                          width: Get.width * .8,
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            controller: loginController.pageViewController,
                            children: [
                              EnterMobileNumberField(
                                loginController:loginController,
                              ),
                              PassWordLoginField(
                                loginController: loginController,
                              ),
                              PinCodeLoginField(
                                loginController: loginController,
                              ),
                              CompleteRegisterField(
                                loginController:loginController,
                              )
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
                                  color: Colors.red.withOpacity(.3),
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
                                    color: Colors.red.withOpacity(.5),
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
                                    color: Colors.red.withOpacity(.8),
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
    );
  }

  Widget bottomPictureLogin() {
    return SizedBox(
      height: Get.height * .1,
      width: Get.width,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/img.png',
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
