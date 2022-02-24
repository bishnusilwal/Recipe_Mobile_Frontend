import 'package:recipe_mobile_frontend/models/user_models.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  final String? uimg;
  final File? image;
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
      this.uimg,
      this.image

      // required this.img
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(message: json["message"], token: json["token"]);
  }

  factory User.fromProfileJson(Map<String, dynamic> json) {
    return User(
        fullname: json["fullname"],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        bio: json['bio'],
        location: json['location'],
        uimg: json['uimg']
        );
  }
}
