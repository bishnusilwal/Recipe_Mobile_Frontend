import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:recipe_mobile_frontend/screens/recipe_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepPurple),
    );
  }
}
