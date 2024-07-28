import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/screens/Profile/UI/view_profile.dart';

import 'package:sizer/sizer.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          actions: [AppLogo(), SizedBox(width: 20)]),
      body: SizedBox(
        height: 89.h,
        width: 100.w,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              TitleText(
                title: "Security",
              ),
              Text(
                "Change security settings.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                  child: SingleChildScrollView(
                child: SizedBox(
                  height: 100.h - 25.h,
                  child: Column(
                    children: [
                      SizedBox(),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "Biometrics",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              "Change PIN",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              "Change Password",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].animate(interval: 50.ms).fade(duration: 100.ms).moveY(
                          duration: 100.ms,
                          begin: 15,
                          end: 0,
                        ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
