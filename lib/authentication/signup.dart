// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/authentication/login.dart';
import 'package:getx_food_recipe/controllers/recipe_controller.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  RecipeController controller = Get.put(RecipeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Signup",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Form(
            key: controller.signupFormKey,
            child: Container(
              height: double.infinity,
              color: Color.fromARGB(255, 77, 75, 75),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://tse4.mm.bing.net/th?id=OIP.1lBsM0NlKeGjb7FsoJ_sGQHaE8&pid=Api&P=0&h=220"),
                                  fit: BoxFit.fill)),
                        ),
                        Positioned(
                            bottom: 60,
                            right: 0,
                            child: Container(
                              height: 65,
                              width: 180,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  left: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "Recipe".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          // label: Text("First name"),
                          // labelText: "First name",
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.emailcontroller,
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
                          controller: controller.passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            } else if (value.length < 6) {
                              return "Password must be 6 characters long";
                            }
                            return null;
                          },
                          obscureText:
                              controller.signup_password_isobscure.value,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isObscure(
                                      controller.signup_password_isobscure);
                                },
                                icon: Icon(
                                  controller.signup_password_isobscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.confirmpasswordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (controller.confirmpasswordcontroller.text !=
                                controller.passwordcontroller.text) {
                              return "Password do not match";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Confirm Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isObscure(controller
                                      .signup_confirm_password_isobscure);
                                },
                                icon: Icon(
                                  controller.signup_confirm_password_isobscure
                                          .value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          obscureText: controller
                              .signup_confirm_password_isobscure.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          bool isValid =
                              controller.signupFormKey.currentState!.validate();
                          if (isValid) {
                            controller.userSignup(context);
                          }
                        },
                        child: Text("Signup",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size.fromHeight(50),
                          // elevation: 10,
                          // shadowColor: Color.fromARGB(255, 58, 181, 172)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Login())));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
