import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_mobile_frontend/http/http_recipe.dart';
import 'package:recipe_mobile_frontend/models/recipe_models.dart';
import 'package:recipe_mobile_frontend/widget/colors.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);
  // String dropdownValue = 'Veg';

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = new TextEditingController();
  final discriptionController = new TextEditingController();
  final pretimeController = new TextEditingController();
  final cooktimeController = new TextEditingController();
  final totaltimeController = new TextEditingController();
  final categoryController = new TextEditingController();
  final ingredientsController = new TextEditingController();
  final directionController = new TextEditingController();
  final rimgController = new TextEditingController();

  File? _pickedImage;

  String dropdownvalue = 'Veg';

  // List of items in our dropdown menu
  var items = [
    'Veg',
    'Non-veg',
    'Vegan',
  ];

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
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              padding: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Column(
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.center,
                                      //     children: [
                                      //       IconButton(
                                      //         onPressed: () {
                                      //           // pickPhoto(ImageSource.camera);
                                      //         },
                                      //         icon: Icon(
                                      //           Icons.camera_alt,
                                      //         ),
                                      //         iconSize: 50.0,
                                      //       ),
                                      //       SizedBox(
                                      //         height: 10.0,
                                      //       ),
                                      //       Container(
                                      //         width: size.width,
                                      //         alignment: Alignment.center,
                                      //         child: Text("Camera"),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Recipe name",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: discriptionController,
                            decoration: const InputDecoration(
                              hintText: "Write Discription",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: pretimeController,
                            decoration: const InputDecoration(
                              hintText: "Pretime",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: cooktimeController,
                            decoration: const InputDecoration(
                              hintText: "Write CookTime",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: totaltimeController,
                            decoration: const InputDecoration(
                              hintText: "Write TotalTime",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: ingredientsController,
                            decoration: const InputDecoration(
                              hintText: "Write Ingredients",
                              border: InputBorder.none,
                            ),
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: directionController,
                            decoration: const InputDecoration(
                              hintText: "Write Direction!",
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
                            child: ElevatedButton(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                // color: Colors.blueAccent,
                                // textColor: Colors.white,
                                onPressed: () async {
                                  if (nameController.text.isNotEmpty ||
                                      discriptionController.text.isNotEmpty ||
                                      pretimeController.text.isNotEmpty ||
                                      cooktimeController.text.isNotEmpty ||
                                      totaltimeController.text.isNotEmpty ||
                                      categoryController.text.isNotEmpty ||
                                      ingredientsController.text.isNotEmpty ||
                                      rimgController.text.isNotEmpty) {
                                    HttpRecipe http = HttpRecipe();
                                    bool isRecipe = await http.addRecipe(Recipe(
                                      name: nameController.text,
                                      description: directionController.text,
                                      preptime: pretimeController.text,
                                      cooktime: cooktimeController.text,
                                      totaltime: totaltimeController.text,
                                      category: categoryController.text,
                                      ingredients: ingredientsController.text,
                                      direction: directionController.text,
                                      image: _pickedImage,
                                    ));

                                    if (isRecipe == true) {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      // builder: (context) => LoginScreen()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Add Recipe failed"),
                                        backgroundColor: Colors.grey,
                                      ));
                                    }
                                  } else {}
                                }),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}
