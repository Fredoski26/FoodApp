import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';

class Dimension{
    static double screenHeight = Get.context!.height;
    static double screenWidth = Get.context!.width;

    static double pageViewContainer = screenHeight/3.84;
    static double pageViewTextContainer = screenHeight/7.03;
    static double pageContainer = screenHeight/2.64;

    static double height10 = screenHeight/84.4;
    static double height15 = screenHeight/56.27;
    static double height20 = screenHeight/42.2;
    static double height30 = screenHeight/28.13;
    static double height45 = screenHeight/18.76;
   static double bottomHeightBar = screenHeight/7.03;

    static double radius15 = screenHeight/56.27;
    static double radius20 = screenHeight/42.2;
    static double radius30 = screenHeight/28.13;


    static double width10 = screenHeight/84.4;
    static double width15 = screenHeight/56.27;
    static double width20 = screenHeight/42.2;
    static double width30 = screenHeight/28.13;

    //font size
    static double font20 = screenHeight/42.2;
    static double font16 = screenHeight/52.75;
    static double font13 = screenHeight/64.9;
    static double font14 = screenHeight/60.28;
    static double font24 = screenHeight/35.16;
    static double font26= screenHeight/32.46;


    /*Icon size*/
   static double iconSize24 = screenHeight/35.17;
   static double iconSize16 = screenHeight/52.75;

   //list view size
static double listViewImgSize = screenWidth/3.25;
static double listViewTextCountSize = screenWidth/3.9;

/*popularFood*/
static double popularFoodImgSize = screenHeight/2.41;
}