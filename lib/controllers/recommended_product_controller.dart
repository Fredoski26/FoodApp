import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/data/repository/recommeded_product_repo.dart';
import 'package:foodapp/models/popularProduct_model.dart';
import 'package:get/get.dart';

import '../models/recommendedProduct_model.dart';
import '../utils/colors.dart';
import 'cart_controller.dart';

class RecommendedProductControll extends GetxController{
  late final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductControll({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList=[];
  late CartController _cart;
  List<ProductModel> get recommendedProductList=> _recommendedProductList;



  //int _inCartItem=0;
  int _quantity=0;
  int  get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItem=>_inCartItems+_quantity;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
     Get.snackbar("Error", "could not find product");
    }
  }

  //controls
/*  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity(_quantity+1);
    }else{
      _quantity =checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      HapticFeedback.vibrate();
      Get.snackbar("Message","You can not continue on zero or below!",icon: Icon(Icons.shopping_basket_outlined), backgroundColor: AppColors.textColor, colorText: Colors.white);
      return 0;
    } else if((_inCartItems+quantity)>10){
      HapticFeedback.vibrate();
      Get.snackbar("Message", "you have reach the maximum",icon: Icon(Icons.shopping_basket_outlined), backgroundColor: AppColors.textColor, colorText: Colors.white);
      return 10;
    }else{
      return quantity;
    }
  }

  void initProduct(RecommendedModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;

    _cart=cart;
    var exist=false;
    exist = _cart.existInCart(product);

    if(exist){
      _inCartItems=cart.getQuantity(product);
    }
  }

  void addItem(RecommendedModel productItem){
    *//* if(_quantity>0){*//*
    _cart.addItem(productItem, _quantity);
    _quantity=0;
    _inCartItems= _cart.getQuantity(productItem);
    _cart.items.forEach((key, value) {
      //  Get.snackbar(title, message)
    });
    *//* }else{
      HapticFeedback.vibrate();
      Get.snackbar("Message", "",icon: Icon(Icons.shopping_basket_outlined), backgroundColor: AppColors.textColor, colorText: Colors.white,messageText: Text("Cart can not be empty", style: TextStyle(fontSize: 14),),);

    }*//*
    update();
  }
  void popUp(){
    const CupertinoAlertDialog(
      title: Text("Item Count"),
      content: Text("Cart can not be empty"),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("Okay"),
        ),
        *//*CupertinoDialogAction(
            child: Text("No"),
          )*//*
      ],
    );
  }

  int get totalItems{
    return _cart.totalItem;
  }*/

}