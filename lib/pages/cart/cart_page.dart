import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_icons.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
 final int pageId;
  const CartPage({Key? key, required this.pageId}) : super(key: key);

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
                    onTap: (){
                          Get.toNamed(RouterHelper.initial);
                         },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backGround: AppColors.textColor,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                  SizedBox(width: Dimension.width20*5,),
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
        ],
      ),
    );
  }
}
