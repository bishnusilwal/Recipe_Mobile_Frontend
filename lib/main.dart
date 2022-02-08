import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepPurple),
    );
  }
}
