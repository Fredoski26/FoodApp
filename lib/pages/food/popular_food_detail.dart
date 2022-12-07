import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/pages/home/main_food_page.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/app_icons.dart';
import 'package:foodapp/widgets/expandable.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../widgets/bg_text.dart';
import '../../widgets/icon_text.dart';
import '../../widgets/small_text.dart';
import '../cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  final bool _enabled = true;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var productList= Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(productList,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularFoodImgSize,
                decoration: BoxDecoration(
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+productList.img!),
                      /* image: AssetImage(
              "assets/image/"
            ),*/
                      ),
                ),
              )),
          Positioned(
              top: Dimension.height45,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
                      if(page=="cartpage"){
                        Get.toNamed(RouterHelper.getCartPage(pageId));
                      }else{
                        Get.toNamed(RouterHelper.getInitial());
                      }
                    },
                 // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MainFoodPage())),
                  child: AppIcon(icon: Icons.arrow_back_ios_new),
                  ),
                  GetBuilder<PopularProductController>(builder: (itemProduct){
                    return Stack(
                     children: [
                       GestureDetector(
                           onTap: (){
                             if(itemProduct.totalItems>=1)
                             Get.to(()=>CartPage());
                           },
                           child: AppIcon(icon: Icons.shopping_cart_checkout_outlined)),
                             itemProduct.totalItems>=1?
                       Positioned(
                         right:0, top:0,
                           child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent, backGround: AppColors.textColor,)):Container(),
                           Get.find<PopularProductController>().totalItems>=1?
                       Positioned(
                           right:3, top:3,
                           child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),size: 12, color: Colors.white,),):Container()
                     ],
                    );
                  }),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height20),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.radius20),
                    topLeft: Radius.circular(Dimension.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: productList.name!,
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    BigText(text: "Food Description"),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Expandable(
                                text:
                                    productList.description!))),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimension.bottomHeightBar,
          padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.navColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimension.radius20 * 2),
              topRight: Radius.circular(Dimension.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimension.height10,
                    bottom: Dimension.height10,
                    left: Dimension.width20,
                    right: Dimension.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                        popularProduct.addItem(productList);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimension.width20*2,
                    ),

                    BigText(text: popularProduct.inCartItem.toString()),
                    SizedBox(
                      height: 1,
                      width: Dimension.width20*2,
                    ),
                    GestureDetector(
                      onTap: (){
                       popularProduct.setQuantity(true);
                       popularProduct.addItem(productList);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(productList);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height10,
                      bottom: Dimension.height10,
                      left: Dimension.width20,
                      right: Dimension.width20),


                    child: BigText(
                      text:"\N${productList.price!}",
                      color: Colors.white,
                    ),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.textColor),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
