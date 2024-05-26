

import 'package:e_commerce/Features/Auth/ViewModel/Services/login_services.dart';
import 'package:flutter/cupertino.dart';

class LoginRepository{
  final _loginService = LoginServices();
  Future<void> loginWithEmail(String email,String password,BuildContext context)async{
    await _loginService.login(email, password,context);

}
}