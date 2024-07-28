import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/utility/enums.dart';
import 'package:mpay/screens/Auth/UI/login.dart';
import 'package:mpay/screens/Auth/UI/otp.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: AppLogo(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 89.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                TitleText(
                  title: "Create your\nAccount",
                ),
                SizedBox(height: 5.h),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade300,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      size: 14,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: isHidingPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade300,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      size: 14,
                    ),
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          isHidingPassword = !isHidingPassword;
                        });
                      },
                      child: Icon(
                        isHidingPassword
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
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
                          builder: (context) => OTPScreen(
                            otpType: OTPType.verifyEmail,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                          height: 1, color: Colors.grey.withOpacity(0.3)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Text(
                        "or continue with",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 1, color: Colors.grey.withOpacity(0.3)),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.withOpacity(0.08),
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/google.png",
                      width: 16,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Sign up with Google"),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          " Sign in",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
