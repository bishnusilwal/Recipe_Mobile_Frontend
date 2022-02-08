import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:recipe_mobile_frontend/models/user_models.dart';

class HttpConnectUser {
  String baseurl =
      'http://c602-2400-1a00-b050-1bba-406e-ffdb-9e5a-51d2.ngrok.io/';

  Future<bool> registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "password": user.password,
      // "fullname": user.fullname,
      "email": user.email,
      // "phone": user.phone,
      // "location": user.location,
      // "bio": user.bio,
    };

    try {
      final response =
          await post(Uri.parse(baseurl + 'user/register'), body: userMap);
        if (response.statusCode == 200) {
          return true;
        }
        return false;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> login(User user) async {
    Map<String, dynamic> userMap = {
      "password": user.password,
      "email": user.email,
    };

    try {
      final response =
          await post(Uri.parse(baseurl + 'user/login'), body: userMap);
        if (response.statusCode == 200) {
          return true;
        }
        return false;
    } catch (e) {
      return Future.error(e);
    }
  }


}
