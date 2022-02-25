import 'package:recipe_mobile_frontend/models/ingredients_models.dart';

class Ingredients {
  final String? IngredientsName;

  Ingredients({
    this.IngredientsName,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      IngredientsName: json['name']
    );
  }
}
