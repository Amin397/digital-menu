import 'package:get/get.dart';
import 'package:untitled13/Screens/EndOrder/end_order_screen.dart';
import 'package:untitled13/Screens/Home/home_screen.dart';
import 'package:untitled13/Screens/Login/login_screen.dart';
import 'package:untitled13/Screens/ProductList/View/product_list_screen.dart';
import 'package:untitled13/Screens/RegisterScreen/register_screen.dart';
import 'package:untitled13/Screens/Reserve%20table/reserve_table_screen.dart';
import 'package:untitled13/Screens/SelectKindOrder/select_kind_order_screen.dart';
import 'package:untitled13/Screens/ShopingBasket/shoping_basket_screen.dart';
import 'package:untitled13/Screens/SignInMobile/signin_screen.dart';
import 'package:untitled13/Screens/FirstProductCategory/product_sub_category_screen.dart';
import 'package:untitled13/Screens/SingleProduct/View/single_product_screen.dart';

class NameRouts {
  static const String registerScreen = '/registerScreen';
  static const String selectKindOrderScreen = '/selectkindorder';
  static const String homeScreen = '/home';
  static const String loginscreen = '/loginscreen';
  static const String reservetable = '/reservetable';
  static const String productCategoryScreen = '/productCategory';
  static const String shopingBasketScreen = '/shopingBasket';
  static const String signinMobile = '/signin';
  static const String endOrderScreen = '/endOrder';
  static const String productList = '/productList';
  static const String singleProduct = '/SingleProduct';

}

class PageRout {
  static List<GetPage> pages = [
    GetPage(name: NameRouts.registerScreen, page: () => RegisterScreen()),
    GetPage(name: NameRouts.selectKindOrderScreen, page: () => SelectKindOrderScreen()),
    GetPage(name: NameRouts.homeScreen, page: () => HomeScreen()),
    GetPage(name: NameRouts.loginscreen, page: () => LoginScreen()),
    GetPage(name: NameRouts.reservetable, page: () => ReserveTable()),
    GetPage(name: NameRouts.productCategoryScreen, page: () => ProductCategoryScreen()),
    GetPage(name: NameRouts.shopingBasketScreen, page: () => ShoppingBasketScreen()),
    GetPage(name: NameRouts.signinMobile, page: () => SignInMobile()),
    GetPage(name: NameRouts.endOrderScreen, page: () => EndOrderScreen()),
    GetPage(name: NameRouts.productList, page: () => ProductListScreen()),
    GetPage(name: NameRouts.singleProduct, page: () => SingleProductScreen()),

  ];
}
