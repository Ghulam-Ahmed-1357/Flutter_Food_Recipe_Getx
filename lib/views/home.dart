// ignore_for_file: unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/authentication/login.dart';
import 'package:getx_food_recipe/controllers/recipe_controller.dart';
import 'package:getx_food_recipe/views/change_password.dart';
import 'package:getx_food_recipe/views/contactus.dart';
import 'package:getx_food_recipe/views/description.dart';
import 'package:getx_food_recipe/views/favorite_recipes.dart';
import 'package:getx_food_recipe/views/setting_page.dart';

import '../utils/util.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  RecipeController controller = Get.put(RecipeController());
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
        appBar: AppBar(
          title: Text(
              controller.selectedIndex == 0 ? "Recipes" : "Favorite Recipes"),
          centerTitle: true,
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
                icon: Icon(Icons.settings))
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onAddButtonTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'All Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite Recipes',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Center(
                  child: DrawerHeader(
                      child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Util.textStyleForHeading("Menu"),
              ))),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(Icons.home),
                title: Text("All Recipes"),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteRecipes(
                                favoriteRecipes: controller.favoriteRecipes,
                                showAppBar: true,
                              )));
                },
                leading: Icon(Icons.favorite),
                title: Text("Favourite Recipes"),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
                leading: Icon(Icons.change_circle),
                title: Text("Change Password"),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contact()));
                },
                leading: Icon(Icons.contact_page),
                title: Text("Contact us"),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false);
                },
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        body: Obx(
          () => PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.selectedIndex.value = index;
              },
              children: [
                (controller.isLoading.value || controller.recipesList.isEmpty)
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.recipesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionPage(
                                          recipeData:
                                              controller.recipesList[index],
                                        )),
                              );
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Card(
                                    elevation: 4,
                                    child: ListTile(
                                      title: Image.network(
                                        '${controller.recipesList[index].image ?? ''}',
                                        height: 120,
                                      ),
                                      subtitle: Text(
                                        textAlign: TextAlign.center,
                                        '${controller.recipesList[index].name ?? ''}',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      trailing: Obx(
                                        () => IconButton(
                                            onPressed: () {
                                              controller.isFavorite(
                                                  index, context);
                                            },
                                            icon: Icon(
                                              controller.recipesList[index]
                                                      .isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: controller.recipesList[index]
                                                      .isFavorite
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                FavoriteRecipes(favoriteRecipes: controller.favoriteRecipes),
              ]),
        ));
  }
}
