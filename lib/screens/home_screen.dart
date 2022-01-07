import 'package:flutter/material.dart';

import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/nutrition_screen.dart';
import 'package:recipe_mobile_frontend/screens/profile.dart';
import 'package:recipe_mobile_frontend/screens/detail_screen.dart';
import 'package:recipe_mobile_frontend/screens/SearchScreen.dart';
import 'package:recipe_mobile_frontend/screens/veg_screen.dart';

import 'ingredient_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        controller: _controller,
        children: [
          Scaffold(
            appBar: AppBar(
              title: Icon(Icons.ac_unit_rounded),
              backgroundColor: Colors.red,
              actions: [
                Icon(Icons.person),
                SizedBox(
                  width: 30,
                )
              ],
            ),
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
                        style: TextStyle(fontSize: 16, color: Colors.green),
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
                        RecipeCard(
                            title: "Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "NOn-Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "Vegan", image: "assets/images/pic1.jpg"),
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
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(fontSize: 16, color: Colors.green),
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
                        RecipeCard(
                            title: "Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "NOn-Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "Vegan", image: "assets/images/pic1.jpg"),
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
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(fontSize: 16, color: Colors.green),
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
                        RecipeCard(
                            title: "Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "NOn-Veg", image: "assets/images/pic1.jpg"),
                        RecipeCard(
                            title: "Vegan", image: "assets/images/pic1.jpg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SearchScreen(),
          // RatingReviewScreen(),

          //RegisterScreen(),
          // SearchScreen(),
          //DetailsScreen(),
          //NutritionInfo(),
          // RatingReviewScreen(),
          FormScreen(),
          // RecipeScreen(),
          ProfileSetUpScreen(
            username: "ram",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            context, MaterialPageRoute(builder: (context) => RecipeScreen()));
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
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
