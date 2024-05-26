
import 'package:e_commerce/Features/ProductCatalog/Repository/add_to_cart_repository.dart';
import 'package:e_commerce/Features/ProductCatalog/Repository/product_repository.dart';
import 'package:e_commerce/Resources/Components/reusuable_button.dart';
import 'package:flutter/material.dart';

import '../../../Resources/Constants/app_constants.dart';

class SpecificProductScreen extends StatelessWidget {
  SpecificProductScreen(
      {super.key,
        required this.name,
        required this.image,
        required this.price,
        required this.description,
        required this.rating});
  String name, image, price, description;
  double rating;
  final addToCartRepo = AddToCartRepo();
  final productRepository = ProductsRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image(image: AssetImage(image))),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'Product Name: $name',
                style: TextStyle(fontSize: mq.height * 0.02),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text('Price: $price',
                  style: TextStyle(fontSize: mq.height * 0.02)),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text('Rating: $rating',
                  style: TextStyle(fontSize: mq.height * 0.02)),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text('Description:\n $description',
                  style: TextStyle(fontSize: mq.height * 0.02)),
              SizedBox(
                height: mq.height * 0.02,
              ),
              FutureBuilder<bool>(
                future: productRepository.isProductInCart(name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data!) {
                      return Text('Already in cart');
                    } else {
                      return ReusuableButton(title: 'Add to Cart', onTap: () {
                        addToCartRepo.addToCart(image, price, name);
                      });
                    }
                  } else {
                    return CircularProgressIndicator(); // Or another placeholder
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
