

import 'package:e_commerce/Features/Auth/ViewModel/Services/signin_services.dart';
import 'package:flutter/cupertino.dart';

class SigninRepository{
  final _signinService = SigninServices();
  Future<void> signinWithEmail(String email,String password,BuildContext context)async{
    await _signinService.signin(email, password,context);

  }
}