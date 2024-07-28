import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/screens/Profile/UI/view_profile.dart';

import 'package:sizer/sizer.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.transparent, actions: [
        Image.asset(
          "assets/mpay-dark.png",
          height: 40,
        ),
        SizedBox(width: 20)
      ]),
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
                title: "Notification",
              ),
              Text(
                "Change notification settings",
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
                        text: "General Notiication",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "Sound",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "Vibrate",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "App Updates",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "Bill Reminder",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
                      ),
                      ProfileListItem(
                        icon: FontAwesomeIcons.moon,
                        text: "Promotion",
                        onTap: () {},
                        isSwitch: true,
                        hasIcon: false,
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
