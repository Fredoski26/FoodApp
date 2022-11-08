import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/controllers/recommended_product_controller.dart';
import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/cart_repo.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/data/repository/recommeded_product_repo.dart';
import 'package:foodapp/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

Future<void> init()async{
  //apiClient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());


  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductControll(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));


}