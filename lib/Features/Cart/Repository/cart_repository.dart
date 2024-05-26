import 'package:e_commerce/Features/Cart/ViewModel/Services/cart_services.dart';
import 'package:flutter/material.dart';

class CartRepository{
  final cartServices = CartServices();
  Future<List<Map<String, dynamic>>> fetchProducts() async{
    try {
      return cartServices.fetchItems();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  void removeFromCart(String id){
    cartServices.removeFromCart(id);
  }
  Future<bool> isProductInCart(String productName) async {
    return await cartServices.isProductInCart(productName);
  }

  Future<int> getLength()async{
    return await cartServices.lengthOfProducts();
  }
  Future<double> totalPrice()async{
    return await cartServices.totalPrice();
  }
}