// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/screens/favourite_screen.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpRecipe http = HttpRecipe();

  List recipes = [];
  List veg = [];
  getVeg() async {
    final res = await http.getCategory();
    setState(() {
      veg = res;
    });
    return res;
  }

  getRecipes() async {
    final res = await http.getRecipe();
    setState(() {
      recipes = res;
    });
    return res;
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
    getVeg();
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
            Container(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...veg.map((r) => RecipeCard(
                      id: r.id,
                      title: r.name,
                      image: "assets/images/pic3.jpg")),
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
                  "Popular Recipes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                    child: Text('View all'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeScreen(
                                    url: "http://localhost:90/recipe/veg",
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
                  ...recipes.map((r) => PopularCard(
                      id: r.id,
                      title: r.name ?? "",
                      image: "assets/images/pic3.jpg"))
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
                  // RecipeCard(title: "Egg", image: "assets/images/pic2.jpg"),
                  // RecipeCard(title: "Poha", image: "assets/images/pic3.jpg"),
                  // RecipeCard(
                  //     title: "Rajasthani", image: "assets/images/pic1.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
