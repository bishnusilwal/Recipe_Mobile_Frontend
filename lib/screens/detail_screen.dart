import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_mobile_frontend/models/Ingredients_models.dart';
import 'package:recipe_mobile_frontend/models/direction_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/screens/rating_review_screen.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_mobile_frontend/screens/recipe_update.dart';
import 'LoginForm.dart';

//import 'package:flutter_rating_bar/flutter_rating_bar.dart'; bro yaii ho jasto lagyo

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool eachvisible = false;

  Recipe recipe = Recipe();
  Direction direction = Direction();
  Ingredients ingredients = Ingredients();

  getRecipes() async {
    final url = Uri.parse(
        "http://8900-2400-1a00-b050-78a2-85b1-c944-5f1d-c30e.ngrok.io/recipe/one/" +
            widget.id);

    final res = await http.get(url);
    print(res.body);
    final data = jsonDecode(res.body);
    final r = Recipe.fromJson((data)['recipe']);
    final d = Direction.fromJson((data)['direction']);
    final i = Ingredients.fromJson((data)['ingredients']);

    setState(() {
      recipe = r;
      direction = d;
      ingredients = i;
    });
    print(data);
    return data;
  }

  @override
  void initState() {
    getRecipes();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  width: size.width,
                  //color: Colors.red,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "http://8900-2400-1a00-b050-78a2-85b1-c944-5f1d-c30e.ngrok.io/" +
                          recipe.rimg!,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                      width: size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.access_alarms))
                        ],
                      )),
                ),
                Positioned(
                  top: 400,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                    top: 360,
                    left: size.width * 0.1,
                    right: size.width * 0.1,
                    child: Container(
                        width: size.width * 0.8,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${recipe.name}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                // Icon(Icons.favorite)
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: 1,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(vertical: 4),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20,
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 16,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 8),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock_clock),
                                      Text("${recipe.totaltime}")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )))
              ],
            ),
            // SizedBox(
            //   height:100,

            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Description\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${recipe.description}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Pretime\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${recipe.preptime}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Cooktime\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${recipe.cooktime}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Category\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${recipe.category}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Ingredients\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${ingredients.IngredientsName}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Direction\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${direction.description}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),

            // Visibility(
            //   visible: eachvisible,
            //   replacement: Container(),
            //   child: Container(
            //     width: double.infinity,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         // ...ingredients.map((e) => Text(e)),
            //       ],
            //     ),
            //   ),
            // ),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => Direction()));
            //       },
            //       child: Text(
            //         "${recipe.name}",
            //         textAlign: TextAlign.end,
            //       ),
            //     ),
            //   ],
            // ),

            SizedBox(height: 19.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateScreen(
                              id: recipe.id!,
                            )));
              },
              child: Text("Update"),
            ),
            const Positioned(
              top: 3,
              right: 15,
              child: Icon(Icons.delete, color: Colors.red, size: 40),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RatingReviewScreen()));
                  },
                  child: Text(
                    'Rating & Review',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
