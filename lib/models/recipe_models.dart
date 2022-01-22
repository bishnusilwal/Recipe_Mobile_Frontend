import 'package:recipe_mobile_frontend/models/Ingredients_models.dart';

class Recipe {
  final String id;
  final String name;
  final String description;
  // final String coverImage;
  final String images;
  // final String preptime;
  // final String cooktime;
  // final String totaltime;
  // final String Servingstime;
  // final String yield;
  // final List<Ingredients> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    // required this.coverImage,
    required this.images,
    // required this.preptime,
    // required this.cooktime,
    // required this.totaltime,
    // required this.Servingstime,
    // required this.yield,
    // required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json["name"],
        id: json["_id"],
        description: json["description"],
        // coverImage: json["coverImage"],
        images: (json["img"] != null) ? json["img"] : "");
    // preptime: json["pretime"],
    // cooktime: json["cooktime"],
    // totaltime: json["totaltime"],
    // Servingstime: json["Servingstime"],
    // yield: json["yield"]);
    // ingredients: json["ingredients"]);
  }
}
