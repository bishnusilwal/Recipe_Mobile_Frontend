import 'package:recipe_mobile_frontend/models/Ingredients_models.dart';

class Recipe {
  final String name;
  final String description;
  final String coverImage;
  final List<String> images;
  final int preptime;
  final int cooktime;
  final int totaltime;
  final int Servingstime;
  final int Yield;
  final List<Ingredients> ingredients;

  Recipe({
    required this.name,
    required this.description,
    required this.coverImage,
    required this.images,
    required this.preptime,
    required this.cooktime,
    required this.totaltime,
    required this.Servingstime,
    required this.Yield,
    required this.ingredients,
  });
}
