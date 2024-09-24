import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_food_recipe/authentication/login.dart';
import 'package:getx_food_recipe/views/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkLogin() {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    }

    Future.delayed(Duration(seconds: 2)).then((value) => checkLogin());

    return Scaffold(
            body: Center(child: CircularProgressIndicator()),
        );
  }
}

