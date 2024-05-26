import 'package:e_commerce/Features/Cart/Repository/cart_repository.dart';
import 'package:e_commerce/Resources/Components/reusuable_button.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:e_commerce/Resources/Theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../Resources/Constants/app_constants.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final cartRepo = CartRepository();
    final navigation = Navigation();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Shopping Cart'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: cartRepo.fetchProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                    CircularProgressIndicator());
              } else if (snapshot.hasError || snapshot.data == null) {
                return Center(
                    child:
                    Text('Error: ${snapshot.error}'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = snapshot.data![index];
                      return ListTile(
                        leading: Image(
                            image: AssetImage(item[
                            'image'])),
                        title: Text(item['name']),
                        subtitle: Text('Rs.${item['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cartRepo.removeFromCart(item['id']);
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: ReusuableButton(
                  title: 'Checkout',
                  onTap: () {
                    navigation.navigateToCheckoutView(context);
                  },
                  width: mq.width * 0.35,
                  color: AppPallete.gradient3,
                )),
          ),
        ],
      ),
    );
  }
}
