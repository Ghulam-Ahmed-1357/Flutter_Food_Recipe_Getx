// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_food_recipe/authentication/login.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:getx_food_recipe/models/model.dart';

import '../utils/util.dart';
import '../views/home.dart';
import '../views/terms_and_conditions.dart';

class RecipeController extends GetxController {
  RxBool signup_password_isobscure = true.obs;
  RxBool signup_confirm_password_isobscure = true.obs;
  RxBool login_password_isobscure = true.obs;
  RxBool current_password_isobscure = true.obs;
  RxBool new_password_isobscure = true.obs;
  RxBool confirm_new_password_isobscure = true.obs;

  bool isVisible = true;

  // for login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  //  for signup
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final changePasswordFormKey = GlobalKey<FormState>();

  RxBool isChecked = false.obs; // for terms and conditions checkbox
  RxBool isLoading = true.obs;
  RxString version = ''.obs;
  RxInt selectedIndex = 0.obs; // for pageview
  final PageController pageController = PageController(initialPage: 0);
  RxList<Recipes> recipesList = <Recipes>[].obs;
  RxList<Recipes> favoriteRecipes = <Recipes>[].obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

// sign up
  void userSignup(BuildContext context) async {
    var email = emailcontroller.text;
    var password = passwordcontroller.text;
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Util.showSuccess(context, "User Created Successfully!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: ((context) => Login())), (_) => false);
      print("User Created Successfully");
    } on FirebaseAuthException catch (e) {
      Util.showError(context, e.message);
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

// login
  void onLogin(BuildContext context) async {
    var email = emailController.text;
    var password = passwordController.text;
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => TermsAndConditions())),
            (_) => false);
      }
    } on FirebaseAuthException catch (e) {
      Util.showError(context, e.message);
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  // Manage obscure text visibility
  void isObscure(RxBool isObscure) {
    isObscure.value = !isObscure.value;
  }

  // Manage pageview
  void onAddButtonTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Manage favorite recipes
  void isFavorite(int index, BuildContext context) {
    recipesList[index].isFavorite = !recipesList[index].isFavorite;
    if (recipesList[index].isFavorite) {
      favoriteRecipes.add(recipesList[index]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('${recipesList[index].name} added to favorite recipes')),
      );
    } else {
      favoriteRecipes.remove(recipesList[index]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '${recipesList[index].name} removed from favorite recipes')),
      );
    }
    recipesList.refresh();
    favoriteRecipes.refresh();
  }

  // Remove from favorite recipes
  void delete_favorite(int index, BuildContext context) {
    favoriteRecipes[index].isFavorite = recipesList[index].isFavorite = false;
    favoriteRecipes.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recipe removed from favorites')),
    );
    favoriteRecipes.refresh();
    recipesList.refresh();
  }

  // Fetch data
  Future<void> getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse('https://dummyjson.com/recipe'));
      await Future.delayed(Duration(seconds: 2));

      if (response.statusCode == 200) {
        isLoading.value = false;
        var jsonResponse = jsonDecode(response.body);
        recipesList.value = (jsonResponse['recipes'] as List)
            .map((recipe) => Recipes.fromJson(recipe))
            .toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Agree to terms
  void agreeToTerms(BuildContext context) {
    if (isChecked.value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: ((context) => HomePage())), (_) => false);
    }
  }

  // Change password
  Future<void> changePassword(BuildContext context) async {
    if (changePasswordFormKey.currentState!.validate()) {
      try {
        String email = user!.email!;

        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: currentPasswordController.text,
        );
        await user!.reauthenticateWithCredential(credential);

        if (newPasswordController.text == confirmNewPasswordController.text) {
          await user!.updatePassword(newPasswordController.text);
          await auth.signOut();
          Util.showSuccess(context, "Password updated! Please login again.");

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: ((context) => Login())), (_) => false);
          passwordController.clear();
        } else {
          Util.showError(context, "Password do not match!");
        }
      } on FirebaseAuthException catch (e) {
        Util.showError(context, e.message);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    user = auth.currentUser; // Initialize the current user
    getData(); // Fetch recipes when controller is initialized
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }
}
