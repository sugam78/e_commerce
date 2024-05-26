import 'package:e_commerce/Features/ProductCatalog/ViewModel/Services/add_to_cart_service.dart';

class AddToCartRepo{
  final addToCartServices = AddToCartService();
  void addToCart(String image,String price,String name){
    return addToCartServices.addToCart(image, price, name);
  }
}