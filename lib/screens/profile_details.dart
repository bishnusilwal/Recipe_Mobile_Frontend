import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';

import '../models/user_models.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late User user;
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
                  "http://fdb4-2400-1a00-b050-78a2-4d7b-ae95-9a75-b37b.ngrok.io/${user.uimg}",
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
          ],
        ),
      ),
    );
  }
}
