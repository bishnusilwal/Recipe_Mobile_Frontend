import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/httpuser.dart';
import 'package:recipe_mobile_frontend/models/user_models.dart';
import 'package:recipe_mobile_frontend/screens/recipe_form.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';
import 'package:recipe_mobile_frontend/widget/custom_button.dart';
import 'package:recipe_mobile_frontend/widget/custom_input.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetUpScreen extends StatefulWidget {
  final String username;
  const ProfileSetUpScreen({Key? key, required this.username})
      : super(key: key);

  @override
  _ProfileSetUpScreenState createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  // final _imagePicker = ImagePicker();
  final fullnameController = new TextEditingController();
  final addressController = new TextEditingController();
  final phoneController = new TextEditingController();
  final bioController = new TextEditingController();
  final uimgController = new TextEditingController();
  File? _pickedImage;

  final ImagePicker _imagePicker = ImagePicker();

  Future pickPhoto(ImageSource source) async {
    final _pickImage = await _imagePicker.pickImage(source: source);
    setState(() {
      _pickedImage = File(_pickImage!.path);
    });
    print(_pickedImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: whiteColor,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Setup Your Profile',
          style: TextStyle(
            color: blackColor,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return new Container(
                      height: 200,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Select One",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.black87,
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        //pickPhoto(ImageSource.camera);
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                      ),
                                      iconSize: 50.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: size.width,
                                      alignment: Alignment.center,
                                      child: Text("Camera"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        pickPhoto(ImageSource.gallery);
                                      },
                                      icon: Icon(
                                        Icons.photo_album_outlined,
                                      ),
                                      iconSize: 50.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: size.width,
                                      alignment: Alignment.center,
                                      child: Text("Gallery"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: (_pickedImage == null)
                  ? CircleAvatar(
                      radius: 60,
                      backgroundColor: inputBoxColor,
                      child: _pickedImage == null
                          ? Icon(
                              Icons.person,
                              size: 60,
                              color: blackColor,
                            )
                          : Image.file(
                              File(_pickedImage!.path),
                              fit: BoxFit.contain,
                            ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundColor: inputBoxColor,
                      backgroundImage: FileImage(
                        File(_pickedImage!.path),
                      ),
                    ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Fullname",
              hint: "Fullname",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
              controller: fullnameController,
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Phone",
              hint: "Phone",
              isInvisible: false,
              icon: Icons.phone,
              suffixIcon: null,
              controller: phoneController,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "address",
              hint: "address",
              isInvisible: false,
              icon: Icons.location_on,
              suffixIcon: null,
              controller: addressController,
            ),
            SizedBox(
              height: 40.0,
            ),
            CustomInputBox(
              size: size,
              title: "Bio",
              hint: "bio",
              isInvisible: false,
              icon: Icons.work,
              suffixIcon: null,
              controller: bioController,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () async {
                  if (fullnameController.text.isNotEmpty ||
                      addressController.text.isNotEmpty ||
                      phoneController.text.isNotEmpty ||
                      bioController.text.isNotEmpty ||
                      uimgController.text.isNotEmpty) {
                    HttpConnectUser http = HttpConnectUser();
                    bool isUser = await http.profilePost(User(
                      fullname: fullnameController.text,
                      location: addressController.text,
                      phone: phoneController.text,
                      bio: bioController.text,
                      image: _pickedImage,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Add user failed"),
                      backgroundColor: Colors.grey,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
