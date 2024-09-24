import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/models/model.dart';
import 'package:getx_food_recipe/views/description.dart';
import '../controllers/recipe_controller.dart';

class FavoriteRecipes extends StatelessWidget {
  FavoriteRecipes(
      {super.key, required this.favoriteRecipes, this.showAppBar = false});
  RecipeController controller = Get.find();
  List<Recipes> favoriteRecipes;
  bool showAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text('Favorite Recipes'),
              backgroundColor: Colors.grey,
            )
          : null,
      body: favoriteRecipes.isEmpty
          ? Column(
              children: [
                if (showAppBar) SizedBox(height: 56),
                Expanded(
                  child: Center(
                    child: Text('No favorites yet!'),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                if (index >= favoriteRecipes.length) return SizedBox.shrink();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                                recipeData: favoriteRecipes[index],
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
                              // range error
                              '${favoriteRecipes[index].image}',
                              // error
                              height: 120,
                            ),
                            subtitle: Text(
                              textAlign: TextAlign.center,
                              // error
                              '${favoriteRecipes[index].name}',
                              // error

                              style: TextStyle(fontSize: 25),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                controller.delete_favorite(index, context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
