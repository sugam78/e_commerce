

import 'package:flutter/cupertino.dart';

import '../../Routes/routes_name.dart';

class Navigation{

  void navigateToLoginScreenR(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesName.login);
  }
  void navigateToSigninScreenR(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesName.signin);
  }
  void navigateToProductsScreenR(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesName.allProducts);
  }

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, RoutesName.login);
  }
  void navigateToSigninScreen(BuildContext context){
    Navigator.pushNamed(context, RoutesName.signin);
  }
  void navigateToProductsScreen(BuildContext context){
    Navigator.pushNamed(context, RoutesName.allProducts);
  }
  void navigateToCartView(BuildContext context){
    Navigator.pushNamed(context, RoutesName.cartView);
  }
  void navigateToSpecificProductScreen(BuildContext context,String name,String image,String price,String description,double rating){
    Navigator.pushNamed(context, RoutesName.specificProduct,arguments: {
      'name':name,
      'image':image,
      'price':price,
      'description':description,
      'rating':rating,
    });
  }

  void navigateToCheckoutView(BuildContext context){
    Navigator.pushNamed(context,RoutesName.checkoutView);
  }
}