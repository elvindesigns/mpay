import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

class ViewBaseScreen extends StatefulWidget {
  const ViewBaseScreen({super.key});

  @override
  State<ViewBaseScreen> createState() => _ViewBaseScreenState();
}

class _ViewBaseScreenState extends State<ViewBaseScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Screen Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'NunitoBold',
                      ),
                    ),
                    Image.asset(
                      "assets/mpay-dark.png",
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ].animate(interval: 50.ms).fade(duration: 100.ms).moveY(
                    begin: 15,
                    end: 0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
