import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mpay/Widgets/app_logo.dart';
import 'package:mpay/Widgets/title_widget.dart';
import 'package:mpay/brand/colors.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String dob = "Date of birth";
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) => Scaffold(
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
                  title: "Edit Profile",
                ),
                Text(
                  "Edit your profile.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: 25),
                Expanded(
                    child: SingleChildScrollView(
                  child: SizedBox(
                    height: 100.h - 30.h,
                    child: Column(
                      children: [
                        SizedBox(),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey.shade300,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            prefixIcon: Icon(
                              FontAwesomeIcons.user,
                              size: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var dateOfBirth = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1924),
                              lastDate: DateTime.now(),
                            );

                            if (dateOfBirth != null) {
                              setState(() {
                                dob = dateOfBirth
                                    .toIso8601String()
                                    .substring(0, 10);
                              });
                            }
                          },
                          child: Container(
                            width: 100.w,
                            height: 60,
                            decoration: BoxDecoration(
                              color: mode.isDark
                                  ? Colors.white.withOpacity(0.05)
                                  : BrandColors().blue.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: mode.isDark
                                    ? Colors.grey.withOpacity(0.3)
                                    : Colors.white,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 15),
                                Icon(
                                  FontAwesomeIcons.calendarDays,
                                  size: 14,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  dob,
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade300,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        IntlPhoneField(
                          decoration: InputDecoration(
                            // labelText: 'Phone Number',
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey.shade300,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          initialCountryCode: 'NG',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        SizedBox(height: 15),
                        TextField(
                          maxLines: 3,
                          minLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey.shade300,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 100.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BrandColors().blue,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ].animate(interval: 30.ms).fade(duration: 100.ms).moveY(
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
      ),
    );
  }
}
