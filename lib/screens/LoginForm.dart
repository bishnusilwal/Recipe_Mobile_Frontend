import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';
import 'package:recipe_mobile_frontend/widget/custom_button.dart';
import 'package:recipe_mobile_frontend/widget/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     color: blackColor,
      //     onPressed: () {},
      //   ),
      //   backgroundColor: whiteColor,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          // Container(width: double.infinity, height: double.infinity, child: Image(fit: BoxFit.cover,image: AssetImage("assests/images/background.png",),),),
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login Here",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  size: size,
                  title: "Username",
                  hint: "Username",
                  isInvisible: false,
                  icon: Icons.person,
                  suffixIcon: null,
                  controller: usernameController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputBox(
                  size: size,
                  title: "Password",
                  hint: "Password",
                  isInvisible: isChecked == false ? true : false,
                  icon: Icons.lock,
                  suffixIcon: isChecked == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  controller: passwordController,
                  error: "",
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: primaryColor,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        "Show Password",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                CustomButton(
                  title: "Signin",
                  textColor: whiteColor,
                  buttonColor: primaryColor,
                  onTap: () {
                    if (usernameController.text.isNotEmpty ||
                        passwordController.text.isNotEmpty) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter a username and password"),
                        backgroundColor: Colors.white,
                      ));
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
