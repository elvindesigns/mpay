import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Profile/UI/set_pin.dart';
import 'package:sizer/sizer.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  TextEditingController textEditingController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  bool hasPickedImage = false;
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 89.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Fill Your Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Don't worry, you can always change it later.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 50),
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.1),
                      ),
                      child: hasPickedImage
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(imagePath),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              FontAwesomeIcons.user,
                              size: 30,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton.filled(
                          iconSize: 12,
                          onPressed: () {
                            getProfileImage();
                          },
                          icon: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                IgnorePointer(
                  ignoring: true,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: BrandColors().blue.withOpacity(0.04),
                      border: InputBorder.none,
                      hintText: "JohnDoe@gmail.com",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidEnvelope,
                        color: BrandColors().lightblue,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors().blue.withOpacity(0.04),
                    border: InputBorder.none,
                    hintText: "Full Name",
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidUser,
                      color: BrandColors().lightblue,
                      size: 14,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                IntlPhoneField(
                  decoration: InputDecoration(
                    // labelText: 'Phone Number',
                    filled: true,
                    fillColor: BrandColors().blue.withOpacity(0.04),
                    border: InputBorder.none,
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  initialCountryCode: 'NG',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                Spacer(),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors().blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetPinScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getProfileImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
        hasPickedImage = true;
      });
    }
  }
}
