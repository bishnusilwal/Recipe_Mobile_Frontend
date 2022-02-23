import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';
import 'package:recipe_mobile_frontend/models/category_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';

import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/home_page.dart';
import 'package:recipe_mobile_frontend/screens/nutrition_screen.dart';
import 'package:recipe_mobile_frontend/screens/profile_form.dart';
import 'package:recipe_mobile_frontend/screens/detail_screen.dart';
import 'package:recipe_mobile_frontend/screens/SearchScreen.dart';
import 'package:recipe_mobile_frontend/screens/veg_screen.dart';
import 'package:recipe_mobile_frontend/screens/profile_form.dart';

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
  PageController controller = PageController();

  void handlePage(index) {
    setState(() {
      currentIndex = index;
    });
    controller.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {},
        controller: controller,
        children: <Widget>[
          HomePage(),
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  HttpConnectUser http = HttpConnectUser();
                  await http.clear();
                },
                child: Text("Logout"),
              ),
            ),
          ),
          LoginScreen(),
          // FormScreen(),
          ProfileSetUpScreen(
            username: "ram",
          ),
          // ProfileDetails(),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RecipeScreen(url: "")));
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
