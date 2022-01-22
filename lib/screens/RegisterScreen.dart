import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';
import 'package:recipe_mobile_frontend/widget/custom_button.dart';
import 'package:recipe_mobile_frontend/widget/custom_input.dart';

import 'LoginForm.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = new TextEditingController();
  final emailController = new TextEditingController();
  final password1Controller = new TextEditingController();
  final password2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: whiteColor,
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/pic1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register Here",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  title: "Username",
                  hint: "Username",
                  isInvisible: false,
                  icon: Icons.person,
                  controller: usernameController,
                  size: size,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  title: "Email address",
                  hint: "Email address",
                  isInvisible: false,
                  icon: Icons.mail,
                  controller: emailController,
                  size: size,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  title: "Password",
                  hint: "Password",
                  isInvisible: true,
                  icon: Icons.lock,
                  controller: password1Controller,
                  size: size,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  title: "Confirm Password",
                  hint: "Confirm Password",
                  isInvisible: true,
                  icon: Icons.lock,
                  size: size,
                  controller: password2Controller,
                ),
                SizedBox(height: 20.0),
                CustomButton(
                  title: "Sign Up",
                  textColor: whiteColor,
                  buttonColor: Colors.red,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));

                    if (usernameController.text.isNotEmpty ||
                        emailController.text.isNotEmpty ||
                        password1Controller.text.isNotEmpty ||
                        password2Controller.text.isNotEmpty) {
                      if (password1Controller.text !=
                          password2Controller.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Password donot match"),
                          backgroundColor: Colors.grey,
                        ));
                      } else {}
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Some error occured please try later"),
                        backgroundColor: Colors.grey,
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
