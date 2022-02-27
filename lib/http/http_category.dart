import 'dart:convert';

import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';

import 'package:http/http.dart' as http;

class HttpCategory {
  Future<List<Category>> getCategories() async {
    try {
      final res = await http.get(Uri.parse(Constants.baseUrl + "category"));
      List data = jsonDecode(res.body);
      List<Category> categories =
          data.map((e) => Category.fromJson(e)).toList();
      return categories;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
