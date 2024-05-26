




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToCartService{
  final auth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseFirestore.instance;
  void addToCart(String image,String price,String name){
    String path = auth.currentUser!.email.toString();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    firebaseStorage.collection(path).doc(id).set({
      'image': image,
      'price': price,
      'name': name,
      'id': id,
    });
  }
}