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
    this.username,
     this.password,
     this.fullname,
     this.email,
     this.phone,
     this.location,
     this.bio,
    // required this.img
  });
}
