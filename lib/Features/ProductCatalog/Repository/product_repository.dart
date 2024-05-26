import 'package:e_commerce/Features/Cart/Repository/cart_repository.dart';
import 'package:e_commerce/Features/ProductCatalog/ViewModel/Services/product_screen_services.dart';
import 'package:flutter/material.dart';

class ProductsRepository{
  final productServices = ProductScreenServices();
  final cartRepository = CartRepository();
  void signOut(BuildContext context)async{
    productServices.signOut(context);
  }
  Future<int> getLength()async{
    return await cartRepository.getLength();
  }
  Future<bool> isProductInCart(String productName) async {
    return await cartRepository.isProductInCart(productName);
  }
}