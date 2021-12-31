import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

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
                      "assets/images/pic1.jpg",
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
                                    "Hello sdfhhfgiuh idofgjdoifg kuyhiuh kuyhiuughuhuio iuhiuhiuyguiogyigiuyogo kjgjhkhbiuhiuhbuibniu uyguiyguytgu",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Icon(Icons.local_movies)
                              ],
                            ),
                            Text(
                              "my name is bishnu silwal",
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
                                // Container(
                                //   height: 20,
                                //   child: RatingBar.builder(
                                //     initialRating: 3,
                                //     minRating: 1,
                                //     direction: Axis.horizontal,
                                //     allowHalfRating: true,
                                //     itemCount: 5,
                                //     itemSize: 16,
                                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                //     itemBuilder: (context, _) => Icon(
                                //         Icons.star,
                                //         color: Colors.amber,
                                //         size: 8),
                                //     onRatingUpdate: (rating) {
                                //       print(rating);
                                //     },
                                //   ),
                                // ),
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
                  "Nutration Info",
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
                Text(
                  "Rating and review ",
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
                Text(
                  "Directions",
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
                Text(
                  "Ingredients",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
