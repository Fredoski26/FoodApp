import 'package:foodapp/pages/cart/cart_page.dart';
import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/food/recommended_food_details.dart';
import 'package:foodapp/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouterHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String cartPage="/cart-page";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static String getCartPage(int pageId)=>'$cartPage?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';


  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),


    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters["pageId"];
     return PopularFoodDetail(pageId:int.parse(pageId!));
    },
   // transition: Transition.fadeIn
    ),


    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters["pageId"];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
        //transition: Transition.fadeIn
    ),


    GetPage(name: cartPage, page: (){
      var pageId=Get.parameters["pageId"];
      return CartPage(pageId:int.parse(pageId!));
    },
      // transition: Transition.fadeIn
    ),
  ];
}