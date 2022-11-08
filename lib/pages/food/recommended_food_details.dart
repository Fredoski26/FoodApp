import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/controllers/recommended_product_controller.dart';
import 'package:foodapp/pages/cart/cart_page.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:foodapp/utils/app_constant.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_icons.dart';
import 'package:foodapp/widgets/bg_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../widgets/expandable.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productList =
        Get.find<RecommendedProductControll>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(productList,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.initial);
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
               // AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(builder: (itemProduct){
                  return GestureDetector(
                    
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(pageId: pageId))),

                     
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:0, top:0,
                            child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent, backGround: AppColors.textColor,)):Container(),

                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right:3, top:3,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),size: 12, color: Colors.white,),):Container()
                      ],
                    ),
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.radius20),
                        topLeft: Radius.circular(Dimension.radius20))),
                child: Center(
                  child: BigText(
                    text: productList.name!,
                    size: Dimension.font26,
                    color: AppColors.mainBlackColor.withOpacity(0.8),
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.colorRed,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    productList.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
/*              image: AssetImage(
              "assets/image/"
            ),*/
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: Expandable(text: productList.description!),
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (recommended) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20 * 2.0,
                  right: Dimension.width20 * 2.0,
                  top: Dimension.height10,
                  bottom: Dimension.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      recommended.setQuantity(false);
                      recommended.addItem(productList);
                      const CupertinoAlertDialog(
                        title: Text("Item Count"),
                        content: Text("can not be empty"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text("Okay"),
                          ),
                          /*CupertinoDialogAction(
            child: Text("No"),
          )*/
                        ],
                      );
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      backGround: AppColors.textColor,
                      iconColor: Colors.white,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                  BigText(
                    text: " \N${productList.price}.00" +
                        " x " +
                        " ${recommended.inCartItem} ",
                    color: AppColors.mainBlackColor,
                    size: Dimension.font26,
                  ),
                  GestureDetector(
                    onTap: () {
                      recommended.setQuantity(true);
                      recommended.addItem(productList);
                      const CupertinoAlertDialog(
                        title: Text("Item Count"),
                        content: Text("can not be empty"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text("Okay"),
                          ),
                          /*CupertinoDialogAction(
            child: Text("No"),
          )*/
                        ],
                      );
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backGround: AppColors.textColor,
                      iconColor: Colors.white,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.textColor,
                      size: 25,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      recommended.addItem(productList);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height10,
                          bottom: Dimension.height10,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      child: BigText(
                        text: "\N${productList.price} | Add to cart",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                          color: AppColors.textColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
