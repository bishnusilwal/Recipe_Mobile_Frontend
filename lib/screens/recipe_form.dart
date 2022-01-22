import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);
  // String dropdownValue = 'Veg';

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  File? _pickedImage;

  String dropdownvalue = 'Veg';

  // List of items in our dropdown menu
  var items = [
    'Veg',
    'Non-veg',
    'Vegan',
  ];

  final _imagePicker = ImagePicker();
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
            'Fill Up Form',
            style: TextStyle(
              color: whiteColor,
            ),
          ),
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // pickPhoto(ImageSource.gallery);
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
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: "Write Ingredients!",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: "Write Directions!",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: "Write nutrition!",
                              border: InputBorder.none,
                            ),
                          ),
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
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
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}

class ImagePicker {}
