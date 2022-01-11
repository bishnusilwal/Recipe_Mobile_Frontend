import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //   body: SafeArea(
      //     child: SingleChildScrollView(
      //         child: Column(
      //       children: [
      //         Stack(
      //           children: [
      //             // Container(
      //             //   height: 300,
      //             //   width: size.width,
      //             //   //color: Colors.red,
      //             //   child: Image(
      //             //     fit: BoxFit.cover,
      //             //     image: AssetImage(
      //             //       "assets/images/pic1.jpg",
      //             //     ),
      //             //   ),
      //             // ),
      //             CircleAvatar(
      //               child: CircleAvatar(

      //                 radius: 150,
      //                  //radius is 50
      //                 backgroundImage: NetworkImage(
      //                     'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'
      //                     ),

      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     )),
      //   ),
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/pic1.jpg'),
              ),
            ),
            SizedBox(),
            Text('Bishnu Silwal'),
            Text('SingUp'),
          ],
        ),
      ),
    );
  }
}
