import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/constants.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class PopularScreen extends StatefulWidget {
  const PopularScreen({
    Key? key,
  }) : super(key: key);
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  List recipes = [];
  getRecipes() async {
    final res = await http
        .get(Uri.parse("http://4bde-2400-1a00-b050-c1a5-d23-cea6-efe2-75d3.ngrok.io/recipe/"));
    final data = jsonDecode(res.body);
    final fasd = data.map((d) => Recipe.fromJson(d)).toList();
    setState(() {
      recipes = fasd;
    });
    return fasd;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
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
              image: Constants.baseUrl + recipes[index].rimg,
              title: recipes[index].name,
            );
          }),
        );
      }),
    );
  }
}