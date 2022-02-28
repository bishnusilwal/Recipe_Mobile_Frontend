import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';
import 'package:recipe_mobile_frontend/screens/LoginForm.dart';
import 'package:recipe_mobile_frontend/screens/profile_form.dart';

import '../models/user_models.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  User user = User();
  HttpConnectUser userHttp = HttpConnectUser();

  Future<User> getUserProfile() async {
    User myuser = await userHttp.getUser();
    setState(() {
      user = myuser;
    });
    print(myuser.fullname);
    return myuser;
  }

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Profile Screen'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  "http://4bde-2400-1a00-b050-c1a5-d23-cea6-efe2-75d3.ngrok.io/${user.uimg}",
                ),
              ),
            ),
            // Text("Bishnu Silwal"),
            const SizedBox(height: 15),
            Text(
              "${user.fullname}",
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 40,
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "${user.email}\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: "${user.phone}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "${user.location}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "${user.bio}\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
              ],
            ),
            SizedBox(height: 19.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileSetUpScreen(
                              username: '',
                            )));
              },
              child: Text("Update user"),
            ),

            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    HttpConnectUser http = HttpConnectUser();
                    await http.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => LoginScreen())));
                  },
                  child: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
