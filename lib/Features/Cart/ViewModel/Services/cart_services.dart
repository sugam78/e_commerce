import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CartServices{
  final firebaseStorage = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> items = [];
  Future<List<Map<String, dynamic>>> fetchItems() async {
    try {
      String userEmail = auth.currentUser!.email?? '';
      List<Map<String, dynamic>> item = [];
      QuerySnapshot querySnapshot = await firebaseStorage.collection(userEmail).get();
      for (var doc in querySnapshot.docs) {
        item.add(doc.data() as Map<String, dynamic>);
      }
      return item;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  void removeFromCart(String id){
    String userEmail = auth.currentUser!.email?? '';
    firebaseStorage.collection(userEmail).doc(id).delete();
  }

  Future<bool> isProductInCart(String productName) async {
    items = await fetchItems(); // Now we await the result of fetchItems
    Set<dynamic> productNames = items.map((item) => item['name']?? '').toSet();
    debugPrint('name ${productNames.toString()}');
    return productNames.contains(productName);
  }



  Future<int> lengthOfProducts()async{
    items = await fetchItems();
    return items.length;
  }

  Future<double> totalPrice()async{
    items = await fetchItems();
    double total = 0;
    for(int i=0;i<items.length;i++){
      total += double.parse(items[i]['price']);
    }
    return total;
  }
}