// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/authentication/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_food_recipe/views/splash_screen.dart';
import 'package:getx_food_recipe/views/terms_and_conditions.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

