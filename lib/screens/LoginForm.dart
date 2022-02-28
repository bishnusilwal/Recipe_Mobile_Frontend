import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';
import 'package:recipe_mobile_frontend/models/user_models.dart';
import 'package:recipe_mobile_frontend/screens/RegisterScreen.dart';
import 'package:recipe_mobile_frontend/screens/home_screen.dart';
import 'package:recipe_mobile_frontend/screens/profile_form.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';
import 'package:recipe_mobile_frontend/widget/custom_button.dart';
import 'package:recipe_mobile_frontend/widget/custom_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences? localStorage;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  void save(token) {
    localStorage!.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: whiteColor,
          onPressed: () {},
        ),
        backgroundColor: blackColor,
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
                  // color: whiteColor,
                  size: size,
                  title: "Password",
                  // buttonColor: Colors.red,
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
                      // Text(
                      //   "Show Password",
                      //   style: TextStyle(
                      //       fontSize: 30.0,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white),
                      // ),
                    ],
                  ),
                ),
                // SizedBox(height: 5.0),
                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomButton(
                  title: "Signin",
                  textColor: whiteColor,
                  buttonColor: Colors.red,
                  onTap: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ProfileSetUpScreen(
                    //         username: "ram",
                    //       ),
                    //     ));

                    if (usernameController.text.isNotEmpty ||
                        passwordController.text.isNotEmpty) {
                      HttpConnectUser http = HttpConnectUser();
                      User user = await http.login(User(
                          username: usernameController.text,
                          password: passwordController.text));
                      print(user.token);
                      if (user.message == "success") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else if (user.message == "invalid") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Login invalid"),
                          backgroundColor: Colors.redAccent,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Login failed"),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter a username and password"),
                        backgroundColor: Colors.white,
                      ));
                    }
                  },
                ),

                SizedBox(width: 100),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have a",
                      style: TextStyle(color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'account?',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(
                          text: ' SingUP',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 19.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text("Register"),
                ),
                // Text(
                //   "Don't have a account? Sing in",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: whiteColor,
                //   ),
                // ),
                // Text(
                //   "Show Password",
                //   style: TextStyle(
                //       fontSize: 30.0,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
