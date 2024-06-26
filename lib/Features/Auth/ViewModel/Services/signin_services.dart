import 'package:e_commerce/Features/Auth/ViewModel/Controller/signin_screen_controller.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SigninServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigation = Navigation();
  final signinController = SigninScreenController();

  Future<void> signin(String email, String password,BuildContext context) async {
    try {

      signinController.loading.value = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        signinController.loading.value = false;
        navigation.navigateToLoginScreenR(context);
      }).onError((error, stackTrace) {
        signinController.loading.value = false;
        SnackBar(content: Text('$error'));
      });

    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text('$e'));
    } catch (e) {
      SnackBar(content: Text('$e'));
    }
  }

}