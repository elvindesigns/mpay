import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mpay/Widgets/page_header.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Profile/UI/edit_profile.dart';
import 'package:mpay/screens/Profile/UI/notifications_settings.dart';
import 'package:mpay/screens/Profile/UI/security_settings.dart';
import 'package:sizer/sizer.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final ImagePicker picker = ImagePicker();
  bool hasPickedImage = false;
  String imagePath = '';
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                PageHeader(
                  pageName: 'Profile',
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Elvin Opara",
                    style: TextStyle(fontSize: 20, fontFamily: 'NunitoBold'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "elvinopara@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 0.7,
                  color: Colors.grey.withOpacity(0.3),
                ),
                SizedBox(height: 10),
                ProfileListItem(
                  icon: FontAwesomeIcons.user,
                  text: "Edit Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.bell,
                  text: "Notifications",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationSettingScreen(),
                      ),
                    );
                  },
                ),
                ProfileListItem(
                  icon: Icons.shield_outlined,
                  text: "Security",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecuritySettingsScreen(),
                      ),
                    );
                  },
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.moon,
                  text: "Dark Theme",
                  onTap: () {},
                  isSwitch: true,
                  onSwitch: (bool value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                  switchValue: AdaptiveTheme.of(context).mode.isDark,
                ),
                ProfileListItem(
                  icon: Icons.lock_outline,
                  text: "Privacy policy",
                  onTap: () {},
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.circleQuestion,
                  text: "Help & Support",
                  onTap: () {},
                ),
                ProfileListItem(
                  icon: Icons.logout,
                  text: "Logout",
                  onTap: () {
                    displayBottomSheet();
                  },
                ),
              ].animate(interval: 30.ms).fade(duration: 80.ms).moveY(
                    duration: 80.ms,
                    begin: 15,
                    end: 0,
                  ),
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

  void displayBottomSheet() {
    showMaterialModalBottomSheet(
      enableDrag: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        width: 100.w,
        height: 30.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "Logout",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                    fontFamily: 'NunitoBold'),
              ),
            ),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 10),
            Text(
              "Are you sure you want to log out?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors().blue,
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Yes, Logout",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatefulWidget {
  final bool isSwitch;
  final bool hasIcon;
  final bool? switchValue;
  final IconData icon;
  final String text;
  final Function onTap;
  final Function? onSwitch;

  const ProfileListItem({
    super.key,
    this.isSwitch = false,
    required this.icon,
    required this.text,
    required this.onTap,
    this.hasIcon = true,
    this.onSwitch,
    this.switchValue,
  });

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isSwitch
          ? null
          : () {
              widget.onTap();
            },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: [
            widget.hasIcon
                ? Icon(
                    widget.icon,
                    size: 17,
                    color: widget.text == 'Logout' ? BrandColors().red : null,
                  )
                : SizedBox(),
            SizedBox(width: 20),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.text == 'Logout' ? BrandColors().red : null,
              ),
            ),
            Spacer(),
            widget.text == 'Logout'
                ? SizedBox()
                : widget.isSwitch
                    ? SizedBox(
                        height: 30,
                        child: Switch(
                          value: widget.switchValue ?? false,
                          onChanged: (value) {
                            if (widget.switchValue != null) {
                              widget.onSwitch!(value);
                            }
                          },
                        ),
                      )
                    : Icon(Icons.arrow_forward_ios, size: 17),
          ],
        ),
      ),
    );
  }
}
