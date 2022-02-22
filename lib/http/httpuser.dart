import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart';
import 'package:recipe_mobile_frontend/models/auth_model.dart';
import 'package:recipe_mobile_frontend/models/user_models.dart';

class HttpConnectUser {
  String baseurl =
      'http://749e-2400-1a00-b050-296f-35a8-83ab-88d0-77d0.ngrok.io/';

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

  Future saveUser(AuthModel model) async {
    var box = await Hive.openBox('token');
    box.add(model);
    print("saved token");
    print(box.values.toList());
  }

  Future clear() async {
    var box = await Hive.openBox('token');
    box.clear();
    print(box);
  }

  Future<User> login(User user) async {
    Map<String, dynamic> userMap = {
      "password": user.password,
      "username": user.username,
    };

    try {
      final response =
          await post(Uri.parse(baseurl + 'user/login'), body: userMap);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        User udata = User.fromJson(data);
        saveUser(AuthModel(token: udata.token));
        print(udata);
        return udata;
      }
      return User(token: null, message: "invalid");
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> profilePost(User user) async {
    Map<String, dynamic> userMap = {
      "fullname": user.fullname,
      "phone": user.phone,
      // "fullname": user.fullname,
      "location": user.location,
      // "phone": user.phone,
      // "location": user.location,
      "bio": user.bio,
      "rimg": user.rimg,
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
}
