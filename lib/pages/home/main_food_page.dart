

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/widgets/bg_text.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: Dimension.height45, bottom: Dimension.height15),
            padding: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Fredrick",
                      color: AppColors.textColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "food",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimension.height45,
                    height: Dimension.height45,
                    child: Icon(Icons.search, color: Colors.white, size: Dimension.iconSize24,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      color: AppColors.textColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(
          child: FoodPageBody()
          ,
        ))
      ],
    ));
  }
}
