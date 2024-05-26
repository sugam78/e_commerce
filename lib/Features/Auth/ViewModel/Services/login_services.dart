import 'package:e_commerce/Features/Auth/ViewModel/Controller/login_screen_controller.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final loginController = LoginScreenController();
  final navigation = Navigation();
  Future<void> login(String email, String password,BuildContext context) async {
    loginController.loading.value = true;
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      loginController.loading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        sharedPreferences.setBool('isLogin', true);
        loginController.loading.value = false;
        navigation.navigateToProductsScreenR(context);

      }).onError((error, stackTrace) {
        loginController.loading.value = false;
        SnackBar(content: Text('$error'));
      });
    } on FirebaseAuthException catch (e) {
      loginController.loading.value = false;
      SnackBar(content: Text('$e'));
    } catch (e) {
      SnackBar(content: Text('$e'));
    }
  }

}