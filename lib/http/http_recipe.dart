import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:http/http.dart' as http;

class HttpRecipe {
  String baseurl =
      'http://e37a-2400-1a00-b050-166a-b14a-645e-349f-310e.ngrok.io/';

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

  Future<bool> addRecipe(Recipe recipe, String? token) async {
    FormData userMap = FormData.fromMap({
      "name": recipe.name,
      "discription": recipe.description,
      "pretime": recipe.preptime,
      "cooktime": recipe.cooktime,
      "totaltime": recipe.totaltime,
      "category": recipe.category,
      "ingredients": recipe.ingredients,
      "direction": recipe.direction,
      "recipe_image":
          await MultipartFile.fromFile(recipe.rimg!, filename: recipe.name),
    });

    Dio dio = Dio();
    try {
      var res = await dio.post(baseurl + 'recipe/', data: userMap);
      if (res.statusCode == 200) {
        print(res);
        return true;
      }
      return false;
    } catch (e) {
      return Future.error(e);
    }
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
