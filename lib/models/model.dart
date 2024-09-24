class RecipeModel {
  final List<Recipes>? recipes;
  final int? total;
  final int? skip;
  final int? limit;

  RecipeModel({
    this.recipes,
    this.total,
    this.skip,
    this.limit,
  });

  RecipeModel.fromJson(Map<String, dynamic> json)
      : recipes = (json['recipes'] as List?)
            ?.map((dynamic e) => Recipes.fromJson(e as Map<String, dynamic>))
            .toList(),
        total = json['total'] as int?,
        skip = json['skip'] as int?,
        limit = json['limit'] as int?;

  Map<String, dynamic> toJson() => {
        'recipes': recipes?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit
      };
}

class Recipes {
  final int? id;
  final String? name;
  final List<String>? ingredients;
  final List<String>? instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final String? difficulty;
  final String? cuisine;
  final int? caloriesPerServing;
  final List<String>? tags;
  final int? userId;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<String>? mealType;
  bool isFavorite;
  bool isVisible;

  Recipes(
      {this.id,
      this.name,
      this.ingredients,
      this.instructions,
      this.prepTimeMinutes,
      this.cookTimeMinutes,
      this.servings,
      this.difficulty,
      this.cuisine,
      this.caloriesPerServing,
      this.tags,
      this.userId,
      this.image,
      this.rating,
      this.reviewCount,
      this.mealType,
      this.isFavorite = false,
      this.isVisible = true});

  Recipes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        ingredients = (json['ingredients'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        instructions = (json['instructions'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        prepTimeMinutes = json['prepTimeMinutes'] as int?,
        cookTimeMinutes = json['cookTimeMinutes'] as int?,
        servings = json['servings'] as int?,
        difficulty = json['difficulty'] as String?,
        cuisine = json['cuisine'] as String?,
        caloriesPerServing = json['caloriesPerServing'] as int?,
        tags =
            (json['tags'] as List?)?.map((dynamic e) => e as String).toList(),
        userId = json['userId'] as int?,
        image = json['image'] as String?,
        rating = (json['rating'] is int)
            ? (json['rating'] as int).toDouble()
            : json['rating'] as double?,
        reviewCount = json['reviewCount'] as int?,
        mealType = (json['mealType'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        isFavorite = json['isFavorite'] as bool? ?? false,
        isVisible = json['isVisible'] as bool? ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'instructions': instructions,
        'prepTimeMinutes': prepTimeMinutes,
        'cookTimeMinutes': cookTimeMinutes,
        'servings': servings,
        'difficulty': difficulty,
        'cuisine': cuisine,
        'caloriesPerServing': caloriesPerServing,
        'tags': tags,
        'userId': userId,
        'image': image,
        'rating': rating,
        'reviewCount': reviewCount,
        'mealType': mealType,
        'isFavorite': isFavorite,
        'isVisible': isVisible
      };
}
