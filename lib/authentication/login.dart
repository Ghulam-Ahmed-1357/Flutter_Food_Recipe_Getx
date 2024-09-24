// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/authentication/signup.dart';
import 'package:getx_food_recipe/controllers/recipe_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  RecipeController controller = Get.put(RecipeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
          key: controller.loginFormKey,
          child: Container(
            height: double.infinity,
            // color: Color.fromARGB(240, 80, 23, 2),
            color: Color.fromARGB(255, 63, 55, 55),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://tse2.mm.bing.net/th?id=OIP.4ihPWq0yuERvxEfGSQglnwHaEK&pid=Api&P=0&h=220"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        obscureText: controller.login_password_isobscure.value,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isObscure(
                                    controller.login_password_isobscure);
                              },
                              icon: Icon(
                                controller.login_password_isobscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, right: 30, left: 30, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid =
                            controller.loginFormKey.currentState!.validate();
                        if (isValid) {
                          controller.onLogin(context);
                        }
                      },
                      child: Text("Login",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          backgroundColor: Color.fromARGB(255, 16, 18, 44)),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Don't have an account? Signup",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Signup())));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
