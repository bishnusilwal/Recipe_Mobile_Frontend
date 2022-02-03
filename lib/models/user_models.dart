import 'package:recipe_mobile_frontend/models/user_models.dart';

class User {
  final String? username;
  final String? password;
  final String? fullname;
  //final List<String> images;
  final String? email;
  final String? phone;
  final String? location;
  final String? bio;
  // final String img;
  //final List<Ingredients> ingredients;

  User({
    required this.username,
    required this.password,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.location,
    required this.bio,
    // required this.img
  });
}
