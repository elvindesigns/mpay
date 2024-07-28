import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/utility/enums.dart';
import 'package:mpay/screens/Auth/UI/set_password.dart';
import 'package:mpay/screens/Profile/UI/set_profile.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatefulWidget {
  final OTPType otpType;
  const OTPScreen({super.key, required this.otpType});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();

  bool shouldResend = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) => Scaffold(
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
                    getTitle(widget.otpType),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'NunitoBold',
                    ),
                  ),
                  Spacer(),
                  Text("Code has been sent to your email"),
                  SizedBox(height: 30),
                  IgnorePointer(
                    ignoring: true,
                    child: PinCodeTextField(
                      appContext: context,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      length: 5,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor:
                            BrandColors().brightblue.withOpacity(0.1),
                        inactiveFillColor: Colors.blueGrey.withOpacity(0.05),
                        activeColor: Colors.blue,
                        inactiveColor: BrandColors().lightblue.withOpacity(.04),
                        activeBorderWidth: 1,
                        inactiveBorderWidth: 1,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,

                      // errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
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
                  shouldResend
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                                color: BrandColors().brightblue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Resend code in",
                              style: TextStyle(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                " 55s",
                                style: TextStyle(
                                    color: BrandColors().brightblue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(10),
                    child: PinKeyboard(
                      length: 5,
                      fontSize: 20,
                      enableBiometric: false,
                      iconBiometricColor: Colors.blue[400],
                      onChange: (pin) {
                        setState(() {
                          textEditingController.text = pin;
                        });
                      },
                      onConfirm: (pin) {
                        if (widget.otpType == OTPType.verifyEmail) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetProfileScreen(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetPasswordScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getTitle(OTPType otpType) {
    String title = '';
    switch (otpType) {
      case OTPType.resetPassword:
        title = "Reset Password";
        break;
      case OTPType.forgotPassword:
        title = "Forgot Password";
        break;
      case OTPType.verifyEmail:
        title = "Verify Email";
        break;
      default:
        title = "Verify Email";
    }
    return title;
  }
}
