import 'dart:convert';
import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:http/http.dart' as http;

class HttpCategory {
  Future<List<Category>> getCategories() async {
    try {
      final res = await http.get(Uri.parse(
          "http://4bde-2400-1a00-b050-c1a5-d23-cea6-efe2-75d3.ngrok.io/category"));
      List data = jsonDecode(res.body);
      List<Category> categories =
          data.map((e) => Category.fromJson(e)).toList();
      return categories;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
