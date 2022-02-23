
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/MainModels/get_routs.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class QrScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  RxBool startScan = false.obs;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result is Barcode) {
        startScan.value = false;
        getRestaurantData(code: result!.code);
      }
    });
  }

  void changeScanFlag() {
    startScan.value = true;
  }

  void getRestaurantData({String? code}) async {
    EasyLoading.show();
    RequestHelper.makePostRequest(
        controller: 'Contractors',
        method: 'singleContractor',
        body: {
          'contractorUrlAddress': code,
        }).then((value) {
      EasyLoading.dismiss();
      if (value.isDone) {
        Blocs.shop.getData(
          value.data,
        );
        Get.offAndToNamed(
          NameRouts.selectKindOrderScreen,
        );
      } else {
        ViewHelper.errorSnackBar(
          message: 'خطایی رخ داد',
        );
      }
    });
  }

  // Location location = Location();
  //
  //
  // void getLocation()async{
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  // }




  @override
  void onClose() {
    controller!.dispose();

    // location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      // print(currentLocation.latitude);
    // });

    super.onClose();
  }
}


  // void getCurrentPosition() async {
  //   Position position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy:
  //   LocationAccuracy.low);
  //
  //   print(position);
  // }


  // void getCurrentPosition() async {
  //   Position position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy:
  //   LocationAccuracy.low);
  //
  //   print(position);
  // }

