import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Helpers/reuqest_helper.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/Home/Model/contractor_sub_category_model.dart';
import 'package:untitled13/Screens/RegisterScreen/Controller/register_controller.dart';

class HomeController extends GetxController {
  // int? whichPage;
  RxBool isLoaded = false.obs;
  List<ContractorSubCategoryModel> categoryList = [];

  @override
  void onInit() {
    getShopCategory();

    RegisterController.customerInfoSaved.read("globalUserNumberSaved");
    super.onInit();
  }

  nextPage(item , index) {
    Get.toNamed(
      'ProductCategory',
      arguments: {
        'item':item,
        'index':index,
      }
    );
  }

  double dividerHeight = 0.0;
  getShopCategory() async {
    RequestHelper.makePostRequest(
      body: {
        'urlAddress': Blocs.shop.shopModel!.urLaddress,
      },
      controller: 'Contractors',
      method: 'restContractorSubCategory'
    ).then((value) {
      if (value.isDone) {
        categoryList = ContractorSubCategoryModel.listFromJson(value.data);
        isLoaded.value = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          dividerHeight = Get.width * .95;
          update();
        });
      } else {
        ViewHelper.errorSnackBar(
          message: 'خطایی رخ داد',
        );
      }
    });
  }
}
