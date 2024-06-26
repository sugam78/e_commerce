import 'package:e_commerce/Features/SplashScreen/ViewModel/Services/splash_services.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashServices().navigateToScreen(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
