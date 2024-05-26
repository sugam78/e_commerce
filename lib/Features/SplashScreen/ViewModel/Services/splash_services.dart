
import 'dart:async';

import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Resources/Constants/app_constants.dart';


class SplashServices{
  final navigation = Navigation();
  void navigateToScreen(BuildContext context){
    Timer(Duration(seconds: 3), () async{
      mq = MediaQuery.of(context).size;
      bool login = await isLogin();
      if(login){
        navigation.navigateToProductsScreenR(context);
      }
      else{
        navigation.navigateToLoginScreenR(context);
      }
    });
  }
  static Future<bool> isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.getBool('isLogin')==null){
      return false;
    }
    else if(sp.getBool('isLogin')==true){
      return true;
    }
    return false;
  }
}