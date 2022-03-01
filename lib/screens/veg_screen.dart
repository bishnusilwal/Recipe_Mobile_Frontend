import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List recipes = [];
  getRecipes() async {
    final res = await http
        .get(Uri.parse(Constants.baseUrl + Constants.recipeUrl + widget.url));
    List data = jsonDecode(res.body);
    print(res.body);
    final fasd = data.map((d) => Recipe.fromJson(d)).toList();
    setState(() {
      recipes = fasd;
    });
    return fasd;
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecipes();
    print(Constants.baseUrl + Constants.recipeUrl + widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("title"),
        backgroundColor: Colors.black12,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(recipes.length, (index) {
            return RecipeCard(
              id: index.toString(),
              image:
                  "http://3046-110-44-119-186.ngrok.io/" +
                      recipes[index].rimg,
              title: recipes[index].name,
            );
          }),
        );
      }),
    );
  }
}
