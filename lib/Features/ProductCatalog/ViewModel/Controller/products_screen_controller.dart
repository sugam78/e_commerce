import 'package:get/get.dart';

import '../../Model/ProductModel.dart';

class ProductsScreenController extends GetxController {


  List<ProductModel> model = [
    ProductModel(
        images: 'Assets/Images/0.jpg',
        name: 'Gaming Mouse',
        price: '890',
        rating: 4.6,
        description:
            'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/1.jpg',
        name: 'A Mouse',
        price: '870',
        rating: 4.4,
        description:
            'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/2.jpg',
        name: 'B Mouse',
        price: '820',
        rating: 4.2,
        description:
            'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/3.jpg',
        name: 'C Mouse',
        price: '780',
        rating: 3.2,
        description:
            'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/4.jpg',
        name: 'D Mouse',
        price: '720',
        rating: 3.8,
        description:
            'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/5.jpg',
        name: 'Z Mouse',
        price: '770',
        rating: 4.4,
        description:
        'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/6.jpg',
        name: 'F Mouse',
        price: '220',
        rating: 4.2,
        description:
        'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/7.jpg',
        name: 'J Mouse',
        price: '320',
        rating: 3.2,
        description:
        'A wonderful product with a b c features. Works fine and has usb wire'),
    ProductModel(
        images: 'Assets/Images/8.jpg',
        name: 'K Mouse',
        price: '440',
        rating: 3.8,
        description:
        'A wonderful product with a b c features. Works fine and has usb wire'),
  ];
}
