import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/controllers/recommended_product_controller.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:foodapp/utils/app_constant.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_icons.dart';
import 'package:foodapp/widgets/bg_text.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  //final int pageId;

  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouterHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backGround: AppColors.textColor,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimension.width20 * 5,
                  ),
                  AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backGround: AppColors.textColor,
                    iconSize: Dimension.iconSize24,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backGround: AppColors.textColor,
                    iconSize: Dimension.iconSize24,
                  ),
                ],
              )),
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width20,
            right: Dimension.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height15),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartControl) {
                      var _cartList = cartControl.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: Dimension.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                      var recommendedIndex =
                                          Get.find<RecommendedProductControll>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);

                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouterHelper.getPopularFood(
                                            popularIndex, "cartpage"));
                                        Get.snackbar("Clicked", "popularFood",backgroundColor: Colors.red, colorText: Colors.white);
                                      } else {
                                        Get.toNamed(
                                            RouterHelper.getRecommendedFood(
                                                recommendedIndex, 'home'));
                                        Get.snackbar(
                                            "Clicked", "RecommendedFood", backgroundColor: Colors.blue,colorText: Colors.white);
                                      }
                                    },
                                    child: Container(
                                      width: Dimension.width20 * 5,
                                      height: Dimension.font20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimension.height10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    _cartList[index].img!)),
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius20),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimension.width10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Dimension.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: _cartList[index].name!,
                                            color: Colors.black,
                                          ),
                                          SmallText(text: "pepper"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text:
                                                    "N ${_cartList[index].price.toString()}",
                                                color: Colors.red,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: Dimension.height10,
                                                    bottom: Dimension.height10,
                                                    left: Dimension.width10,
                                                    right: Dimension.width10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimension.radius20),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        //popularProduct.setQuantity(false);
                                                        // popularProduct.addItem(productList);
                                                        cartControl.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimension.width10 * 2,
                                                    ),
                                                    BigText(
                                                        text: _cartList[index]
                                                            .quantity
                                                            .toString()),
                                                    SizedBox(
                                                      height: 1,
                                                      width:
                                                          Dimension.width10 * 2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // popularProduct.setQuantity(true);
                                                        //  popularProduct.addItem(productList);
                                                        cartControl.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
