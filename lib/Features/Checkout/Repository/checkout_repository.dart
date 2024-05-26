import 'package:e_commerce/Features/Cart/Repository/cart_repository.dart';


class CheckoutRepository{
  final cartRepo = CartRepository();

  Future<double> totalPrice()async{
    return cartRepo.totalPrice();
  }
  Future<List<Map<String, dynamic>>> fetchProducts() async{
    try {
      return cartRepo.fetchProducts();
    } catch (e) {
      return [];
    }
  }

}