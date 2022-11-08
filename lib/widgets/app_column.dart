
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import '../utils/dimension.dart';
import 'package:foodapp/widgets/small_text.dart';

import '../utils/colors.dart';
import 'bg_text.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (product){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimension.font26,),
          SizedBox(
            height: Dimension.height10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                  5, (index) => Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 15,
                    )),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(text: "4.5"),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(text: "3450", color: AppColors.titleColor,),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(text: "comments",color: AppColors.titleColor),
            ],
          ),
          SizedBox(
            height: Dimension.height10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                  icon: Icons.gpp_good_rounded,
                  text: "Normal",
                  iconColor: AppColors.titleColor),
              IconAndText(
                  icon: Icons.location_on_rounded,
                  text: "2.5km",
                  iconColor: AppColors.titleColor),
              IconAndText(
                  icon: Icons.access_time_rounded,
                  text: "20mins",
                  iconColor: AppColors.titleColor),
            ],
          ),
        ],
      );
    });
  }
}
