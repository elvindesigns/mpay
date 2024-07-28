import 'package:flutter/material.dart';
import 'package:mpay/brand/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:sizer/sizer.dart';

class PINDialog extends StatefulWidget {
  const PINDialog({super.key});

  @override
  State<PINDialog> createState() => _PINDialogState();
}

class _PINDialogState extends State<PINDialog> {
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
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Enter PIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Enter your PIN to confirm your operation",
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
                    hintStyle: TextStyle(fontSize: 30),
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
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                      Navigator.pop(context, true);
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
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  child: PinKeyboard(
                    length: 6,
                    fontSize: 20,
                    enableBiometric: false,
                    iconBiometricColor: Colors.blue[400],
                    onChange: (pin) {
                      setState(() {
                        textEditingController.text = pin;
                      });
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
