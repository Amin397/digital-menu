import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/MainModels/get_routs.dart';

class SuccessController extends GetxController {


  deleteData() async {
    Blocs.aminBasket.clearAllData();
      Get.offAllNamed(
        NameRouts.selectKindOrderScreen,
      );
  }
}
