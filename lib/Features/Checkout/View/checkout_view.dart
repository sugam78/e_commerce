
import 'package:e_commerce/Features/Checkout/Repository/checkout_repository.dart';
import 'package:e_commerce/Resources/Components/reusuable_button.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:flutter/material.dart';


class CheckoutVew extends StatefulWidget {
  const CheckoutVew({super.key});
  @override
  State<CheckoutVew> createState() => _CheckoutVewState();
}

class _CheckoutVewState extends State<CheckoutVew> {
  final checkoutRepo = CheckoutRepository();
  final navigation = Navigation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: checkoutRepo.fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator()); // Show loading indicator while waiting for data
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(child: Text('Error: ${snapshot.error}')); // Handle any errors
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = snapshot.data![index];
                        return ListTile(
                          leading: Image(image: AssetImage(item['image'])), // Assuming images are hosted online
                          title: Text(item['name']),
                          trailing: Text('Rs.${item['price']}'),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:',style: TextStyle(fontSize: 25),),
                FutureBuilder(future: checkoutRepo.totalPrice(), builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // Show loading indicator while waiting for data
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Handle any errors
                  } else {
                    return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 25),);
                  }
                }),
              ],
            ),
            ReusuableButton(title: 'Pay', onTap: (){}),
          ],
        ),
      ),

    );
  }
}
