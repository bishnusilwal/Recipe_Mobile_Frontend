import 'package:flutter/material.dart';

import 'package:http/http.dart';

class HttpConnectUser {
  String baseurl = 'http://10.2.2:3000';

  void registerPost(user) async {
    Map<String, dynamic> userMap = {
      "username":user.username,
      "password":user.password,
      "fullname":user.fullname,
      "email":user.email,
      "phone":user.phone,
      "location":user.location,
      "bio":user.bio,
    };

    try {
      final response =
          await post(Uri.parse(baseurl + 'auth/register'), body: userMap);
          if (response.statusCode==200){

          }
    } catch (e) {
      print(e);
    }
  }
}
