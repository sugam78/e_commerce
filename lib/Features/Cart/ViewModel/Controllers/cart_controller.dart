import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool delete = false.obs;
  void deleteFromCart(){
    delete.value = true;
  }

}
