import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Direction extends StatelessWidget {
  const Direction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                    image: AssetImage(
                      "assets/images/pic3.jpg",
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
                      color: Colors.white,
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
                                    "Russian Mushroom and Potato Soup",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Icon(Icons.favorite)
                              ],
                            ),
                            Text(
                              "You have 5 Direction",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
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
                                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                                      Text("50min")
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
                Text(
                  "Direction",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Step 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text:
                                '''Melt the butter in a large pot over medium heat. Saute the onions in the butter for 
                            5 minutes. Add the mushrooms and saute for 5 more minutes. Stir in the 
                            dill, paprika, soy sauce and broth. Reduce heat to low, cover, and simmer for 15 minutes.\n''',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: 'Step 2\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text:
                                '''Melt the butter in a large pot over medium heat. Saute the onions in the butter for 
                            5 minutes. Add the mushrooms and saute for 5 more minutes. Stir in the 
                            dill, paprika, soy sauce and broth. Reduce heat to low, cover, and simmer for 15 minutes.\n''',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
