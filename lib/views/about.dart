// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_food_recipe/controllers/recipe_controller.dart';
import '../utils/util.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  RecipeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Util.textStyleForHeading(
                'About us:',
              ),
              SizedBox(height: 10),
              Util.textStyleForText(
                'Welcome to GetX Food Recipe – your go-to platform for discovering, creating, and sharing delicious recipes from around the world! \nAt GetX Food Recipe, we believe that cooking is more than just a daily task; it’s an art, a passion, and a way to bring people together. Our mission is to inspire food lovers of all skill levels, from novice home cooks to seasoned chefs, by providing access to a diverse range of easy-to-follow recipes.',
              ),
              SizedBox(height: 10),
              Util.textStyleForHeading('What We Offer'),
              SizedBox(height: 10),
              Util.textStyleForText(
                  '\t\tThousands of Recipes: Explore a wide variety of recipes from different cuisines, meal types, and difficulty levels. Whether you’re looking for a quick weekday dinner or an elaborate dish for a special occasion, we’ve got you covered! \n\n\t\t Step-by-Step Instructions: Our easy-to-follow recipes include detailed instructions, photos, and tips to ensure your cooking experience is smooth and successful. \n\n\t\t Personalized Suggestions: Based on your preferences and past cooking experiences, we suggest recipes that match your taste buds and skill level. \n\n\t\t Healthy & Dietary-Friendly Options: From vegan to keto, gluten-free to high-protein, we offer recipes to meet various dietary needs and preferences. \n\n\t\t Favorite & Save Recipes: Found a recipe you love? Save it to your favorites for easy access, and come back to it anytime.'),
              SizedBox(height: 20),
              Util.textStyleForHeading(
                'Our Vision',
              ),
              SizedBox(height: 10),
              Util.textStyleForText(
                'We are passionate about bringing people closer through the joy of cooking and sharing. Whether it’s rediscovering old family recipes or experimenting with new flavors, we aim to build a community that celebrates food, culture, and creativity.\n\nJoin us as we continue to explore new cuisines, enhance our skills, and share the love for good food.',
              ),
              SizedBox(height: 20),
              Util.textStyleForHeading(
                'Developer Info',
              ),
              SizedBox(height: 10),
              Util.textStyleForText(
                'Developed by Ghulam Ahmed.',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
