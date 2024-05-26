import 'package:e_commerce/Features/SplashScreen/View/splash_screen.dart';
import 'package:e_commerce/Resources/Theme/app_pallete.dart';
import 'package:e_commerce/Routes/routes.dart';
import 'package:e_commerce/Routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD6LqOZz_geK2Wue4ogzAuRtd91xVs4Ybc',
      appId: '1:891055516386:android:780d35278b7bc67a1d4cbb',
      messagingSenderId: '891055516386',
      projectId: 'ecommerce-bac5b',

    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: AppPallete.gradient1,
        ),
      ),
      home: const SplashScreen(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

