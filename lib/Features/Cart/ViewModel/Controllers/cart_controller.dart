/*import 'package:get/get.dart';
import 'package:e_commerce/Features/Cart/ViewModel/Services/cart_services.dart';

class CartController extends GetxController {
  final CartServices cartServices = CartServices();

  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateItems(); // Fetch items when controller initializes
  }

  void updateItems() async {
    items.value = await cartServices.fetchItems();
  }

  void removeFromCart(String id) {
    cartServices.removeFromCart(id);
    updateItems(); // Update items after removal
  }
}*/
