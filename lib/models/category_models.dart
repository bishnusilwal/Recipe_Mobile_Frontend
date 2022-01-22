import 'package:recipe_mobile_frontend/models/category_models.dart';

class Category {
  final String name;
  final String id;

  Category({required this.name, required this.id});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json["name"],
      id: json["_id"],
    );
  }
}
