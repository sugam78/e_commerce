import 'package:flutter/material.dart';
import 'package:e_commerce/Resources/Components/reusuable_button.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:e_commerce/Features/ProductCatalog/Repository/add_to_cart_repository.dart';
import 'package:e_commerce/Features/ProductCatalog/Repository/product_repository.dart';
import 'package:e_commerce/Features/ProductCatalog/ViewModel/Controller/products_screen_controller.dart';
import 'package:e_commerce/Features/ProductCatalog/ViewModel/Services/product_screen_services.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final products = ProductsScreenController();
  final navigation = Navigation();
  final services = ProductScreenServices();
  final productRepository = ProductsRepository();
  final addToCartRepo = AddToCartRepo();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          Badge(
            child: IconButton(
              onPressed: () => navigation.navigateToCartView(context),
              icon: Icon(Icons.shopping_cart),
            ),
            label: FutureBuilder<int>(
              future: productRepository.getLength(),
              builder: (context,snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data.toString());
                } else {
                  return CircularProgressIndicator(); // Or another placeholder
                }
              },
            ),
          ),
          IconButton(
              onPressed: () => productRepository.signOut(context),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: products.model.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.5),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () => navigation.navigateToSpecificProductScreen(
                        context,
                        products.model[index].name.toString(),
                        products.model[index].images.toString(),
                        products.model[index].price.toString(),
                        products.model[index].description.toString(),
                        products.model[index].rating!.toDouble()),
                    child: Column(
                      children: [
                        Image(
                            height: MediaQuery.of(context).size.height * 0.3,
                            image: AssetImage(products.model[index].images.toString())),
                        Text(products.model[index].name.toString()),
                        Text('Rs ${products.model[index].price}'),
                        FutureBuilder<bool>(
                          future: productRepository.isProductInCart(products.model[index].name.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasData && snapshot.data!) {
                                return Text('Already in cart');
                              } else {
                                return ReusuableButton(
                                  title: 'Add to cart',
                                  onTap: () {
                                    addToCartRepo.addToCart(products.model[index].images.toString(), products.model[index].price.toString(), products.model[index].name.toString());
                                  },
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                );
                              }
                            } else {
                              return CircularProgressIndicator(); // Or another placeholder
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
