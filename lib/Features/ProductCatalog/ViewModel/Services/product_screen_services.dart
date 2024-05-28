

import 'package:e_commerce/Features/Cart/ViewModel/Services/cart_services.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreenServices{
  FirebaseAuth auth = FirebaseAuth.instance;
  final navigation = Navigation();
  void signOut(BuildContext context)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', false);
    auth.signOut();
    navigation.navigateToLoginScreen(context);
  }


}