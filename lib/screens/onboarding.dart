import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Auth/UI/login.dart';
import 'package:mpay/screens/Auth/UI/register.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        controllerColor: BrandColors().blue,
        finishButtonText: 'Register',
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
          );
        },
        finishButtonStyle: FinishButtonStyle(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
          backgroundColor: BrandColors().blue,
        ),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(
            color: BrandColors().blue,
          ),
        ),
        trailing: Text(
          'Login',
          style: TextStyle(fontFamily: 'NunitoBold'),
        ),
        trailingFunction: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        background: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 30,
              right: 30,
            ),
            child: Image.asset('assets/slide-1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 30,
              right: 30,
            ),
            child: Image.asset('assets/slide-2.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 30,
              right: 30,
            ),
            child: Image.asset('assets/slide-3.png'),
          ),
        ],
        centerBackground: true,
        totalPage: 3,
        speed: 1.8,
        pageBackgroundColor: Colors.white,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text(
                  'Bill Payments with Ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoBold',
                    color: BrandColors().blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Say goodbye to complicated payment processes. Our app makes paying for your utilities simple and straightforward, all in one place.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text(
                  'Secure Payment System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoBold',
                    color: BrandColors().blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enjoy peace of mind with our secure payment system. Your transactions are encrypted and protected, ensuring your data stays safe.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text(
                  'Seamless User Experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoBold',
                    color: BrandColors().blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Experience a smooth and intuitive interface designed to make your utility payments hassle-free. Manage everything with just a few taps.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
