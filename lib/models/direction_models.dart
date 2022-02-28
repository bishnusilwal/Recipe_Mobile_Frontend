import 'package:recipe_mobile_frontend/models/direction_models.dart';

class Direction {
  final String? description;

  Direction({
    this.description,
  });

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(description: json['discription']);
  }
}
