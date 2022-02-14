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
  final String? token;
  final String? message;
  final String? rimg;
  // final String img;
  //final List<Ingredients> ingredients;

  User(
      {this.username,
      this.password,
      this.fullname,
      this.email,
      this.phone,
      this.location,
      this.bio,
      this.token,
      this.message,
      this.rimg

      // required this.img
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(message: json["message"], token: json["token"]);
  }
}
