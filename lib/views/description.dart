// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/models/model.dart';
import 'package:getx_food_recipe/utils/util.dart';
import '../controllers/recipe_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescriptionPage extends StatelessWidget {
  DescriptionPage({super.key, required this.recipeData});
  Recipes recipeData;
  RecipeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: Colors.white,
                  child: Image.network(
                    '${recipeData.image}',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Util.textStyleForHeading('Rating: '),
                  Util.textStyleForText('${recipeData.rating}'),
                ],
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                rating: recipeData.rating!,
                itemCount: 5,
                itemSize: 40,
                unratedColor: Colors.amber.withAlpha(70),
                direction: Axis.horizontal,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Util.textStyleForHeading(
                    'Total Review:',
                  ),
                  Util.textStyleForText(
                    '${recipeData.reviewCount}',
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Util.textStyleForHeading(
                'Name: ${recipeData.name}',
              ),
              SizedBox(
                height: 10,
              ),
              Util.textStyleForHeading('Ingredients: '),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.ingredients!
                    .map((ingredient) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Util.textStyleForText(
                            '${ingredient}',
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Util.textStyleForHeading(
                'Recipe:',
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipeData.instructions!
                    .map((instructions) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Util.textStyleForText(
                            '${instructions}',
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Util.textStyleForHeading(
                'Commonly this meal is for ${recipeData.mealType!.join()}',
              ),
              SizedBox(
                height: 10,
              ),
              Util.textStyleForHeading('Difficulty: ${recipeData.difficulty}')
            ],
          ),
        ),
      ),
    );
  }
}
