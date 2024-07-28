import 'package:flutter/material.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Profile/UI/set_fingerprint.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:sizer/sizer.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  TextEditingController textEditingController = TextEditingController();

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
                  "Create New PIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Add a PIN for secure and easy access to your account.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                IgnorePointer(
                  ignoring: true,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 70,
                      fieldWidth: 75,
                      activeFillColor:
                          BrandColors().brightblue.withOpacity(0.1),
                      inactiveFillColor: Colors.blueGrey.withOpacity(0.05),
                      activeColor: Colors.blue,
                      inactiveColor: BrandColors().lightblue.withOpacity(.04),
                      activeBorderWidth: 1,
                      inactiveBorderWidth: 1,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
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
                          builder: (context) => SetFingerprintScreen(),
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  child: PinKeyboard(
                    length: 4,
                    fontSize: 20,
                    enableBiometric: false,
                    iconBiometricColor: Colors.blue[400],
                    onChange: (pin) {
                      setState(() {
                        textEditingController.text = pin;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
