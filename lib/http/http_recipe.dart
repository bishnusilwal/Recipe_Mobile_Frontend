import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:http/http.dart' as http;

class HttpRecipe {
  String baseurl =
      'http://fdb4-2400-1a00-b050-78a2-4d7b-ae95-9a75-b37b.ngrok.io/';

  Future getToken() async {
    var box = await Hive.openBox('token');
    var data = box.getAt(0);
    print("get token: " + data.token.toString());
    return data.token;
  }

  Future<List> getRecipe() async {
    try {
      final response = await http.get(Uri.parse(baseurl + "recipe/"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List recipes = data.map((i) => Recipe.fromJson(i)).toList();

        return recipes;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> addRecipe(Recipe recipe) async {
    print(recipe.image!.path);
    Map<String, String> data = {
      "name": recipe.name ?? "",
      "discription": recipe.description ?? "",
      "pretime": recipe.preptime ?? "",
      "cooktime": recipe.cooktime ?? "",
      "totaltime": recipe.totaltime ?? "",
      "category": recipe.category ?? "",
      "ingredients": recipe.ingredients ?? "",
      "direction": recipe.direction ?? "",
      "filename": "${recipe.name}_image"
    };

    var box = await Hive.openBox('token');
    var token = box.getAt(0).token;
    Map<String, String> headers = {
      'X-Requested-With': 'XMLHttpRequest',
      'authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data;application/json;charset=UTF-8',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseurl + 'recipe/'),
    );
    request.fields.addAll(data);
    request.headers.addAll(headers);
    var multipartFile = await http.MultipartFile.fromPath(
        'recipe_image', recipe.image!.path,
        filename: "${recipe.name}_image"); //returns a Future<MultipartFile>
    request.persistentConnection = false;
    request.files.add(multipartFile);
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
  }

  Future<List> getCategory() async {
    try {
      final response = await http.get(Uri.parse(baseurl + "category/"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List recipes = data.map((i) => Category.fromJson(i)).toList();
        return recipes;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
