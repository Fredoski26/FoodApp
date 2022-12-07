import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/controllers/recommended_product_controller.dart';
import 'package:foodapp/models/popularProduct_model.dart';
import 'package:foodapp/models/recommendedProduct_model.dart';
import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/food/recommended_food_details.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:foodapp/utils/app_constant.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/bg_text.dart';
import 'package:foodapp/widgets/icon_text.dart';
import 'package:foodapp/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.83);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimension.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });

  }



  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GetBuilder<PopularProductController>(builder: (popularProduct){
         if (popularProduct.isLoaded) {
           return Container(
           height: Dimension.pageContainer,
             child: PageView.builder(

                 controller: pageController,
                 itemCount: popularProduct.popularProductList.length,
                 itemBuilder: (context, position) {
                   return _buildPageItem(position, popularProduct.popularProductList[position]);
                 }),

         );
         } else {
           return CircularProgressIndicator(color: AppColors.colorRed,);
         }
       }),
        GetBuilder<PopularProductController>(builder: (popularDot){
          return DotsIndicator(
            dotsCount: popularDot.popularProductList.isEmpty?1:popularDot.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.textColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Paring",
                ),
              )
            ],
          ),
        ),

       GetBuilder<RecommendedProductControll>(builder: (recommendedProduct)
       {
        if (recommendedProduct.isLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index) {

              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouterHelper.getRecommendedFood(index, "home"));
                },
                child: Container(

                  margin: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: Dimension.height10),
                    child:  Row(
                      children:[
                        Container(
                          width: Dimension.listViewImgSize,
                          height: Dimension.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.radius20),
                            //color: Colors.white30,
                            color: index.isEven
                                ? const Color(0xffdaef20)
                                : const Color(0xffc09696),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+recommendedProduct.recommendedProductList[index].img!)
                              /*image: AssetImage( ""

                    ),*/
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimension.listViewTextCountSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimension.radius20),
                                bottomRight: Radius.circular(Dimension.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimension.width20,
                                  right: Dimension.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(
                                    height: Dimension.height10,
                                  ),
                                  Text(recommendedProduct.recommendedProductList[index].description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12,
                                    height: 1.2,

                                  ),),
                                  //SmallText(text: recommendedProduct.recommendedProductList[index].description!,overflow: TextOverflow.fade),
                                  SizedBox(
                                    height: Dimension.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconAndText(
                                          icon: Icons.gpp_good_rounded,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor),
                                      IconAndText(
                                          icon: Icons.location_on_rounded,
                                          text: "2.5km",
                                          iconColor: AppColors.iconColor),
                                      IconAndText(
                                          icon: Icons.access_time_rounded,
                                          text: "20mins",
                                          iconColor: AppColors.iconColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                ),
              );
            });
        } else {
          return CircularProgressIndicator(
          color: AppColors.colorRed,
        );
        }
       }),
      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTran = _height * (1 - currentScale) / 2;
      //matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTran = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTran = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else {
      var currentScale2 = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale2, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(RouterHelper.getPopularFood(index, "home"));
              },
              child: Container(
                height: Dimension.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimension.width10, right: Dimension.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius30),
                  color: index.isEven
                      ? const Color(0xffdaef20)
                      : const Color(0xffc09696),
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+"/uploads/"+popularProduct.img!)
                    /* image: AssetImage(
                "assets/image/"
              ),*/
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                margin: EdgeInsets.only(
                    left: Dimension.width30,
                    right: Dimension.width30,
                    bottom: Dimension.height30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      ),
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height15,
                      left: Dimension.height15,
                      right: Dimension.height15),
                  child: AppColumn(
                    text: popularProduct.name!,
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}
