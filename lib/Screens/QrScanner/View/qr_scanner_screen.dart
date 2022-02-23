import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Screens/QrScanner/Controller/qr_scanner_controller.dart';
import 'package:untitled13/Screens/SelectKindOrder/Widgets/bottom_picture_select_kind_order.dart';

class QrScannerScreen extends StatelessWidget {
  QrScannerScreen({Key? key}) : super(key: key);

  QrScannerController qrScannerController = Get.put(
    QrScannerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              const Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Center(
                    child: AutoSizeText(
                      'برای مشاهده منو و سفارش ابتدا QR را اسکن کنید',
                      maxLines: 2,
                      maxFontSize: 18.0,
                      minFontSize: 12.0,
                      style: TextStyle(
                        color: ColorUtils.textColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Obx(
                    () => (qrScannerController.startScan.value)
                        ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: QRView(
                              key: qrScannerController.qrKey,
                              onQRViewCreated: qrScannerController.onQRViewCreated,
                            ),
                        )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'assets/anim/qrscanner.json',
                                height: Get.height * .3,
                                width: Get.height * .3,
                              ),
                              TextButton(
                                onPressed: () {
                                  qrScannerController.changeScanFlag();
                                },
                                child: const Text(
                                  'اسکن کنید',
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomPictureSelectKindOrder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
