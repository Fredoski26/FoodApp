import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/models/popularProduct_model.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  late final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItem => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  //controls
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      HapticFeedback.vibrate();
      Get.snackbar("Message", "You can not continue on zero or below!",
          icon: Icon(Icons.shopping_basket_outlined),
          backgroundColor: AppColors.textColor,
          colorText: Colors.white);
      // if(_inCartItems>0){
      //   _quantity = - _inCartItems;
      //   return _quantity;
      // }
      return 0;
    } else if ((_inCartItems + quantity) > 10) {
      if (_inCartItems >= 10) {
        _quantity = -_inCartItems;
      }
      HapticFeedback.vibrate();
      Get.snackbar("Message", "you have reach the maximum",
          icon: Icon(Icons.shopping_basket_outlined),
          backgroundColor: AppColors.textColor,
          colorText: Colors.white);

      return inCartItem;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = cart.getQuantity(product);
    }
  }

  void addItem(ProductModel productItem) {
    /* if(_quantity>0){*/
    _cart.addItem(productItem, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(productItem);
    _cart.items.forEach((key, value) {
      print("The Id " +
          value.id!.toString() +
          " Quantity is" +
          value.quantity.toString());
    });
    /* }else{
      HapticFeedback.vibrate();
      Get.snackbar("Message", "",icon: Icon(Icons.shopping_basket_outlined), backgroundColor: AppColors.textColor, colorText: Colors.white,messageText: Text("Cart can not be empty", style: TextStyle(fontSize: 14),),);

    }*/
    update();
  }

  void popUp() {
    const CupertinoAlertDialog(
      title: Text("Item Count"),
      content: Text("Cart can not be empty"),
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
  }

  int get totalItems {
    return _cart.totalItem;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
