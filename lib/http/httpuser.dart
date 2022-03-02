import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_mobile_frontend/models/auth_model.dart';
import 'package:recipe_mobile_frontend/models/user_models.dart';

class HttpConnectUser {
  String baseurl = 'http://3b5b-116-66-195-154.ngrok.io/';

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
          await http.post(Uri.parse(baseurl + 'user/register'), body: userMap);
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
          await http.post(Uri.parse(baseurl + 'user/login'), body: userMap);
      print(response);
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
    Map<String, String> data = {
      "fullname": user.fullname ?? "",
      "phone": user.phone ?? "",
      "location": user.location ?? "",
      "bio": user.bio ?? "",
      "filename": "${user.fullname}_image"
    };

    var box = await Hive.openBox('token');
    print("hellslf");
    var token = box.getAt(0).token;
    print("somes");
    Map<String, String> headers = {
      'X-Requested-With': 'XMLHttpRequest',
      'authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data;application/json;charset=UTF-8',
    };

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(baseurl + 'user/'),
    );
    request.fields.addAll(data);
    request.headers.addAll(headers);
    var multipartFile = await http.MultipartFile.fromPath(
        'user_image', user.image!.path,
        filename: "${user.fullname}_image"); //returns a Future<MultipartFile>
    request.persistentConnection = false;
    request.files.add(multipartFile);
    print("hello");
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(response.stream);
        return true;
      }
      print("object");
      return false;
    } catch (e) {
      return Future.error(e);
    }
    return false;

    // try {
    //   final response =
    //       await post(Uri.parse(baseurl + 'user/register'), body: userMap);
    //   if (response.statusCode == 200) {
    //     return true;
    //   }
    //   return false;
    // } catch (e) {
    //   return Future.error(e);
    // }
  }

  Future<User> getUser() async {
    var box = await Hive.openBox('token');
    var token = box.getAt(0).token;
    final response =
        await http.get(Uri.parse(baseurl + "user/profile/"), headers: {
      'Authorization': 'Bearer ' + token,
    });
    if (response.statusCode == 200) {
      print(token);
      print(response.body);
      User a = User.fromProfileJson(jsonDecode(response.body));

      return a;
    } else {
      throw Exception('Failed to load User');
    }
  }
}
