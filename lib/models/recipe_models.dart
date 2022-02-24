import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recipe_mobile_frontend/models/Ingredients_models.dart';

class Recipe {
  final String? id;
  final String? name;
  final String? description;

  final String? preptime;
  final String? cooktime;
  final String? totaltime;
  final String? category;
  final String? ingredients;
  final String? direction;
  final String? rimg;
  final File? image;

  Recipe({
    this.id,
    this.name,
    this.description,
    this.preptime,
    this.cooktime,
    this.totaltime,
    this.category,
    this.ingredients,
    this.direction,
    this.rimg,
    this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json["name"],
      id: json["_id"],
      description: json["description"],
      rimg: (json["img"] != null) ? json["img"] : "",
      preptime: json["pretime"],
      cooktime: json["cooktime"],
      totaltime: json["totaltime"],
      category: json['category'],
    );
  }
}
