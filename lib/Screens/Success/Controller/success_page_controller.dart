import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/MainModels/get_routs.dart';
import 'package:untitled13/MainModels/user_model.dart';

class SuccessController extends GetxController {


  deleteData() async {
    Blocs.aminBasket.clearAllData();
      Get.offAllNamed(
        NameRouts.selectKindOrderScreen,
      );
  }



  @override
  void onInit() {
    if(Blocs.user.user is UserModel){
      Future.delayed(const Duration(seconds: 2) , (){
        deleteData();
      });
    }
    super.onInit();
  }
}
