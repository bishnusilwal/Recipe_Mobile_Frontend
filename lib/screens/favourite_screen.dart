import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List recipes = [];
  Future<List> getRecipes() async {
    var box = await Hive.openBox('token');
    var token = box.getAt(0).token;
    final res = await http.get(Uri.parse(Constants.baseUrl + "favourite"),
        headers: {"Authorization": "Bearer $token"});
    List data = jsonDecode(res.body);
    List fasd = data.map((d) => Recipe.fromJson(d)).toList();
    print("res: " + res.body);
    setState(() {
      recipes = fasd;
    });
    return fasd;
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Your Favourite Recipes"),
        backgroundColor: Colors.black12,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(recipes.length, (index) {
            return RecipeCard(
              id: index.toString(),
              image: Constants.baseUrl + recipes[index].rimg,
              title: recipes[index].name,
            );
          }),
        );
      }),
    );
  }
}
