import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/utility/enums.dart';
import 'package:mpay/screens/Auth/UI/otp.dart';
import 'package:sizer/sizer.dart';

class ForgotResetpasswordScreen extends StatefulWidget {
  final bool isResettingPassword;
  const ForgotResetpasswordScreen({
    super.key,
    this.isResettingPassword = false,
  });

  @override
  State<ForgotResetpasswordScreen> createState() =>
      _ForgotResetpasswordScreenState();
}

class _ForgotResetpasswordScreenState extends State<ForgotResetpasswordScreen> {
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
                  widget.isResettingPassword
                      ? "Change Password"
                      : "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Image.asset("assets/forgot-password.png"),
                widget.isResettingPassword
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Select how your password should be Changed.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            splashColor: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13),
                            onTap: () {
                              setState(() {
                                selectedPosition = 1;
                              });
                            },
                            child: ResetPasswordChannel(
                              isSelected: selectedPosition == 1,
                              channel: "via Email",
                              value: "4eve****@gmail.com",
                              image: Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            splashColor: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13),
                            onTap: () {
                              setState(() {
                                selectedPosition = 2;
                              });
                            },
                            child: ResetPasswordChannel(
                              isSelected: selectedPosition == 2,
                              image: Icon(
                                FontAwesomeIcons.solidMessage,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Type in your Email Address assosciated\nwith your account.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              hintStyle: TextStyle(
                                color: Colors.blueGrey.shade300,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidEnvelope,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            otpType: OTPType.resetPassword,
                          ),
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
          color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.3),
          width: 1,
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
