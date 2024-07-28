import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mpay/Widgets/title_widget.dart';

import 'package:sizer/sizer.dart';

class BaseScreenViewTemplate extends StatefulWidget {
  const BaseScreenViewTemplate({super.key});

  @override
  State<BaseScreenViewTemplate> createState() => _BaseScreenViewTemplateState();
}

class _BaseScreenViewTemplateState extends State<BaseScreenViewTemplate> {
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
                title: "Page Name",
              ),
              SizedBox(height: 15),
              Expanded(
                  child: SingleChildScrollView(
                child: SizedBox(
                  height: 100.h - 25.h,
                  child: Column(
                    children: [SizedBox()]
                        .animate(interval: 50.ms)
                        .fade(duration: 100.ms)
                        .moveY(
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
