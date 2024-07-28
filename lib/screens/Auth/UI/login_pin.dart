import 'package:flutter/material.dart';
import 'package:mpay/Widgets/navigator.dart';

import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Auth/UI/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:sizer/sizer.dart';
import 'package:local_auth/local_auth.dart';

class LoginPINScreen extends StatefulWidget {
  const LoginPINScreen({super.key});

  @override
  State<LoginPINScreen> createState() => _LoginPINScreenState();
}

class _LoginPINScreenState extends State<LoginPINScreen> {
  TextEditingController textEditingController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: BrandColors().blue,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     right: 20.0,
                      //     top: 20,
                      //   ),
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: IconButton(
                      //       iconSize: 35,
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       icon: Icon(
                      //         Icons.close,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Spacer(),
                      Image.asset(
                        "assets/mpay.png",
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Enter your PIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Spacer(),
                      IgnorePointer(
                        ignoring: true,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          obscureText: true,
                          blinkWhenObscuring: false,
                          animationType: AnimationType.fade,
                          mainAxisAlignment: MainAxisAlignment.center,
                          hintCharacter: '●',
                          obscuringCharacter: '●',
                          obscuringWidget: Text(
                            '●',
                            style: TextStyle(
                              fontSize: 30,
                              color: BrandColors().red,
                            ),
                          ),
                          hintStyle:
                              TextStyle(fontSize: 30, color: Colors.white),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 70,
                            fieldWidth: 40,
                            activeFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                            activeColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                            activeBorderWidth: 1,
                            inactiveBorderWidth: 1,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: BrandColors().blue,
                          enableActiveFill: true,
                          controller: textEditingController,
                          onCompleted: (v) {
                            print("Completed");
                            gotoDashboard();
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              // currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Forgot your PIN?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: PinKeyboard(
                  length: 6,
                  fontSize: 20,
                  enableBiometric: true,
                  iconBiometricColor: Colors.blue[400],
                  onChange: (pin) {
                    setState(() {
                      textEditingController.text = pin;
                    });
                  },
                  onBiometric: () {
                    authenticateWithBiometrics();
                  },
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  authenticateWithBiometrics() async {
    final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to sign in',
        options: const AuthenticationOptions(biometricOnly: true));

    if (didAuthenticate) {
      print("Authenticated");
      gotoDashboard();
    }
  }

  void gotoDashboard() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AppNaviagtor()),
      (Route<dynamic> route) => false,
    );
  }
}
