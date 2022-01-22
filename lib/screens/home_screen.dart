import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';

import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/nutrition_screen.dart';
import 'package:recipe_mobile_frontend/screens/profile_form.dart';
import 'package:recipe_mobile_frontend/screens/detail_screen.dart';
import 'package:recipe_mobile_frontend/screens/SearchScreen.dart';
import 'package:recipe_mobile_frontend/screens/veg_screen.dart';
import 'package:http/http.dart' as http;
import 'ingredient_screen.dart';
import 'profile_details.dart';
import 'rating_review_screen.dart';
import 'recipe_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  void handlePage(index) {
    setState(() {
      currentIndex = index;
    });
    _controller.jumpToPage(currentIndex);
  }

  List recipes = [];
  List veg = [];
  final urlveg = Uri.parse("http://localhost:90/category/");
  getVeg() async {
    final res = await http.get(urlveg);
    final data = jsonDecode(res.body);
    final hj = data.map((d) => Category.fromJson(d)).toList();
    print(veg);
    setState(() {
      veg = hj;
    });
    return hj;
  }

  final url = Uri.parse("http://localhost:90/recipe/");

  getRecipes() async {
    final res = await http.get(url);
    final data = jsonDecode(res.body);
    final fasd = data.map((d) => Recipe.fromJson(d)).toList();
    setState(() {
      recipes = fasd;
    });
    return fasd;
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
    getVeg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        controller: _controller,
        children: [
          Scaffold(
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
                            // id: r.id,
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
                                    builder: (context) => RecipeScreen(url: "http://localhost:90/recipe/veg",)));
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
                            title: r.name,
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
                                    builder: (context) => RecipeScreen(url: "http://localhost:90/",)));
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
                        RecipeCard(
                            title: "Egg", image: "assets/images/pic2.jpg"),
                        RecipeCard(
                            title: "Poha", image: "assets/images/pic3.jpg"),
                        RecipeCard(
                            title: "Rajasthani",
                            image: "assets/images/pic1.jpg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SearchScreen(),
          // RatingReviewScreen(),

          RegisterScreen(),
          // SearchScreen(),
          // DetailsScreen(),
          //NutritionInfo(),
          // RatingReviewScreen(),
          // FormScreen(),
          // RecipeScreen(),

          ProfileDetails()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (index) {
          handlePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (currentIndex == 0) ? Colors.red : Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (currentIndex == 1) ? Colors.red : Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: (currentIndex == 2) ? Colors.red : Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (currentIndex == 3) ? Colors.red : Colors.green,
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  GestureDetector _categoryCircle(String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeScreen(url: "")));
      },
      child: Column(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(right: 5),
          ),
          Text(title)
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image,
                  ),
                )),
            margin: EdgeInsets.only(right: 5),
          ),
          Center(child: Text(title, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}

class PopularCard extends StatefulWidget {
  const PopularCard({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String id;
  final String title;
  final String image;

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      id: widget.id,
                    )));
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.image,
                  ),
                )),
            margin: EdgeInsets.only(right: 5),
          ),
          Center(
              child: Text(widget.title, style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
