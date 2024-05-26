
import 'package:e_commerce/Features/Auth/View/login_screen.dart';
import 'package:e_commerce/Features/Auth/View/signin_screen.dart';
import 'package:e_commerce/Features/Cart/View/cart_view.dart';
import 'package:e_commerce/Features/Checkout/View/checkout_view.dart';
import 'package:e_commerce/Features/ProductCatalog/View/products_screen.dart';
import 'package:e_commerce/Features/ProductCatalog/View/specific_product_screen.dart';
import 'package:e_commerce/Features/SplashScreen/View/splash_screen.dart';
import 'package:e_commerce/Routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.cartView:
        return MaterialPageRoute(builder: (context) => CartView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.signin:
        return MaterialPageRoute(builder: (context) => SignInScreen());
      case RoutesName.allProducts:
        return MaterialPageRoute(builder: (context) => ProductsScreen());
      case RoutesName.specificProduct:
        if (settings.arguments != null &&
            settings.arguments is Map<String, dynamic>) {
          var productArgs = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (context) => SpecificProductScreen(
                  name: productArgs['name'] ?? '',
                  image: productArgs['image'] ?? '',
                  price: productArgs['price']?.toString() ?? '',
                  description: productArgs['description'] ?? '',
                  rating: productArgs['rating']?.toDouble() ?? 0.0));
        } else {
          throw Exception("Invalid arguments for SpecificProductScreen");
        }
      case RoutesName.checkoutView:
        return MaterialPageRoute(builder: (context)=>CheckoutVew());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(child: Text('No routes available')),
          );
        });
    }
  }
}
