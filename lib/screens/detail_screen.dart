import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:recipe_mobile_frontend/fingerprint/auth.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/models/Ingredients_models.dart';
import 'package:recipe_mobile_frontend/models/direction_models.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/models/review_models.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_mobile_frontend/screens/recipe_update.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';
import 'LoginForm.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  final reviewController = new TextEditingController();
  HttpRecipe hhtpRecipe = HttpRecipe();
  LocalAuthApi localAuth = LocalAuthApi();

  bool eachvisible = false;

  Recipe recipe = Recipe();
  Direction direction = Direction();
  Ingredients ingredients = Ingredients();
  List<Review> review = [];

  getRecipes() async {
    final url = Uri.parse(
        "http://3b5b-116-66-195-154.ngrok.io/recipe/one/" + widget.id);

    final res = await http.get(url);
    final data = jsonDecode(res.body);
    final r = Recipe.fromJson((data)['recipe']);
    final d = Direction.fromJson((data)['direction']);
    final i = Ingredients.fromJson((data)['ingredients']);
    List rev = (data)['review'];
    List<Review> revi = rev.map((e) => Review.fromJson(e)).toList();
    setState(() {
      recipe = r;
      direction = d;
      ingredients = i;
      review = revi;
    });
    print(recipe.rimg);
    return data;
  }

  // Future addToFav(String id) async {
  //   final url =
  //       Uri.parse("http://3046-110-44-119-186.ngrok.io/favourite/recipe/$id");
  //   var box = await Hive.openBox('token');
  //   var token = box.getAt(0).token;
  //   final res =
  //       await http.post(url, headers: {"Authorization": "Bearer $token"});
  //   print(url);
  //   if (res.statusCode == 200) {
  //     return "Liked";
  //   }
  // }

  addToFav() async {
    final url = Uri.parse(
        "http://3b5b-116-66-195-154.ngrok.io/favourite/recipe/" + widget.id);
    var box = await Hive.openBox('token');
    var token = box.getAt(0).token;
    final res =
        await http.post(url, headers: {"Authorization": "Bearer $token"});
    print(res.body);
    if (res.statusCode == 200) {
      return "Liked";
    }
  }

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  @override
  void dispose() {
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
                      "http://3b5b-116-66-195-154.ngrok.io/${recipe.rimg}",
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
                                Container(
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite),
                                    color: Colors.white,
                                    onPressed: () async {
                                      await addToFav();
                                    },
                                  ),
                                )
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

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rating",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                hhtpRecipe.rateRecipe(rating, recipe.id!);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: inputBoxColor,
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: reviewController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  hintText: "Write something!",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.black,
                onPressed: () async {
                  bool isFingerCorrect = await localAuth.authenticate();
                  if (isFingerCorrect == true) {
                    await hhtpRecipe.reviewRecipe(
                        reviewController.text, recipe.id!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Finger print not matched")));
                  }
                },
              ),
            ),

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

            IconButton(
                onPressed: () async {
                  content:
                  NotificationContent(
                      id: 3,
                      channelKey: 'key1',
                      title: 'Just a notification',
                      body: 'You just Update Your Profile',
                      notificationLayout: NotificationLayout.BigPicture,
                      bigPicture:
                          'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70');
                  // );
                  // await hhtpRecipe.deleteRecipe(recipe.id!);
                },
                icon: Icon(Icons.delete)),

            ...review.map((r) => Column(
                  children: [
                    Text(r.user!),
                    Text(r.review!),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
