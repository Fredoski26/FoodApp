

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/data/repository/cart_repo.dart';
import 'package:foodapp/models/popularProduct_model.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../pages/cart/cart_page.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

   CartController({required this.cartRepo});
  Map<int, CartModel> _item = {};

  Map<int, CartModel> get items=>_item;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity=0;
    if(_item.containsKey(product.id!)){
      _item.update(product.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          img: value.img,
          price: value.price,
          quantity: value.quantity!+quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
 if(totalQuantity<=0){
   _item.remove(product.id);
 }
    }else{
      if(quantity>0){
       // print("length"+_item.length.toString());
        _item.putIfAbsent(
            product.id!,
                () {
              //Get.snackbar("Message", "message add to cart"+product.id.toString()+ "quant"+quantity.toString());
             //  print("adding id "+product.id!.toString()+ " quantity " +quantity.toString());
              return CartModel(
                id: product.id,
                name: product.name,
                img: product.img,
                price: product.price,
                quantity: quantity,
                isExist: true,
                time: DateTime.now().toString(),
                product: product,
              );});
      }else{
        HapticFeedback.vibrate();
      }
    }
update();
  }

  bool existInCart(ProductModel product){
    if(_item.containsKey(product.id!)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity=0;
    if(_item.containsKey(product.id!)){
      _item.forEach((key, value) {
        if(key==product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
  int get totalItem{
    var  totalQuantity=0;
    _item.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
   return _item.entries.map((e){
   return   e.value;
    }
    ).toList();
  }
}
