// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/http_category.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:recipe_mobile_frontend/screens/favourite_screen.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:recipe_mobile_frontend/screens/pouplar_screen.dart';
import 'package:recipe_mobile_frontend/screens/veg_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpRecipe httpRecipe = HttpRecipe();
  HttpCategory httpCate = HttpCategory();

  List recipes = [];
  List veg = [];
  List recommended = [];
  List<Category> category = [];
  getVeg() async {
    final res = await httpRecipe.getCategory();
    setState(() {
      veg = res;
    });
    return res;
  }

  getRecipes() async {
    final res = await httpRecipe.getRecipe();
    setState(() {
      recipes = res;
    });
    return res;
  }

  Future getRecommendedRecipe() async {
    List recipes = await httpRecipe.getRecommendRecipe();
    setState(() {
      recommended = recipes;
    });
    return recipes;
  }

  Future getCategory() async {
    List<Category> categories = await httpCate.getCategories();
    setState(() {
      category = categories;
    });
    return categories;
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
    getVeg();
    getRecommendedRecipe();
    getCategory();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      // appBar: AppBar(
      //   title: Icon(Icons.ac_unit_rounded),
      //   backgroundColor: Colors.red,
      //   actions: [
      //     Icon(Icons.person),
      //     SizedBox(
      //       width: 30,
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // controller: controller,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category Recipes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ...category.map((r) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeScreen(url: r.name.toLowerCase())));
                        },
                        child: Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage("assets/images/pic2.jpg"))
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              r.name,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Recipes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                    child: Text('View all'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularScreen()));
                    })
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...recipes.map((r) => PopularCard(
                      id: r.id,
                      title: r.name ?? "",
                      image: "http://4bde-2400-1a00-b050-c1a5-d23-cea6-efe2-75d3.ngrok.io/" + r.rimg))
                  // ,
                  // PopularCard(
                  //     title: "Paneer Masala Fry",
                  //     image: "assets/images/pic1.jpg"),
                  // PopularCard(
                  //     title: "Keema Naan",
                  //     image: "assets/images/pic2.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation Recipes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                    child: Text('View all'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecipeScreen(
                                    url: "http://localhost:90/",
                                  )));
                    })
              ],
            ),
            SizedBox(
              height: 10,
              
            ),

            Container(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...recommended.map((e) => RecipeCard(
                      title: e.name,
                      image: "http://4bde-2400-1a00-b050-c1a5-d23-cea6-efe2-75d3.ngrok.io/" + e.rimg,
                      id: e.id))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
