import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';

class VegScreen extends StatefulWidget {
  const VegScreen({Key? key}) : super(key: key);

  @override
  _VegScreenState createState() => _VegScreenState();
}

class _VegScreenState extends State<VegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title")),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(10, (index) {
            return RecipeCard(
              image: "assets/images/pic1.jpg",
              title: "pizza",
            );
          }),
        );
      }),
    );
  }
}
