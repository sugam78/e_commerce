
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Features/Cart/Repository/cart_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToCartService{
  final auth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseFirestore.instance;
  final cartRepo = CartRepository();
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

  Future<bool> isInCart(String image,String price,String name,String id)async{
    List<Map<String, dynamic>> item = await cartRepo.fetchProducts();
    if(item.contains({
      'image': image,
      'price': price,
      'name': name,
      'id': id,
    })){
      return true;
    }
    return false;
  }
}