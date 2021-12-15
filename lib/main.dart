import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'MainModels/get_routs.dart';

void main() async {
  await GetStorage.init();

  runApp(
    RefreshConfiguration(
      headerBuilder: () => const WaterDropHeader(),
      footerBuilder: () => const ClassicFooter(),
      headerTriggerDistance: 80.0,
      springDescription: const SpringDescription(
        stiffness: 170,
        damping: 16,
        mass: 1.9,
      ),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: GetMaterialApp(
        defaultTransition: Transition.noTransition,
        localizationsDelegates: const [
          RefreshLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        getPages: PageRout.pages,
        initialRoute: NameRouts.selectKindOrderScreen,
        theme: ThemeData(
          fontFamily: 'iranSanc',
        ),
        // builder: EasyLoading.init(),
      ),
    ),
  );
  // configLoading();
}

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.cubeGrid
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..userInteractions = false
//     ..dismissOnTap = false
//     ..indicatorSize = 100.0
//     ..fontSize = 18.0
//     ..progressColor = ColorUtils.splash
//     ..backgroundColor = Colors.transparent
//     ..indicatorColor = ColorUtils.splash
//     ..textColor = Colors.white
//   // ..maskColor = Colors.blue
//     ..maskType = EasyLoadingMaskType.black
//     ..userInteractions = true
//     ..dismissOnTap = true;
// }
