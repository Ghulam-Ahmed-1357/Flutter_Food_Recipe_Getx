// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_food_recipe/authentication/login.dart';
import 'package:getx_food_recipe/views/about.dart';
import 'package:getx_food_recipe/views/change_password.dart';
import 'package:getx_food_recipe/views/contactus.dart';
import 'package:getx_food_recipe/views/privacy_policy.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          Divider(),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Change Password',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          Divider(),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'About the App',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          Divider(),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Contact us',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.logout)
                ],
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false);
              },
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
