import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/success_dialog.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Auth/UI/login.dart';

import 'package:sizer/sizer.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({
    super.key,
  });

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController textEditingController = TextEditingController();
  int selectedPosition = 1;

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
                  "Create New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Image.asset("assets/set-4password.png"),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Create your new password.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter New Password",
                        hintStyle: TextStyle(
                          color: Colors.blueGrey.shade300,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          size: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Colors.blueGrey.shade300,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors().blue,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Color.fromARGB(192, 3, 23, 41),
                        builder: (context) => SuccessDialog(
                          willRedirect: true,
                          message:
                              "Your password has been reset. You will be redirected to the login screen in a few seconds.",
                          redirectFunction: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
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
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordChannel extends StatelessWidget {
  final String channel;
  final String value;
  final Icon image;
  final bool isSelected;
  const ResetPasswordChannel({
    super.key,
    this.channel = "via SMS",
    this.value = "+234 801*****99",
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blue.withOpacity(0.1)),
            child: Center(
              child: image,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                channel,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
