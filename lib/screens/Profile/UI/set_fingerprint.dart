import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpay/Widgets/navigator.dart';
import 'package:mpay/Widgets/success_dialog.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Auth/Controller/local_storage.dart';
import 'package:sizer/sizer.dart';

class SetFingerprintScreen extends StatefulWidget {
  const SetFingerprintScreen({super.key});

  @override
  State<SetFingerprintScreen> createState() => _SetFingerprintScreenState();
}

class _SetFingerprintScreenState extends State<SetFingerprintScreen> {
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
                  "Enroll Your Biometrics",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'NunitoBold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Add biometrics for easy access and to make \nyour account more secure",
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.fingerprint,
                  size: 150,
                  color: Colors.blue,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please tap here to get started enrolling your biometrics.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.withOpacity(0.15),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierColor: Color.fromARGB(192, 3, 23, 41),
                            builder: (context) => SuccessDialog(
                              willRedirect: true,
                              redirectFunction: () async {
                                await AppLocalStorage.setHasBeenOnboarded(true);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppNaviagtor()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              message:
                                  "Your account is ready to use. You will be redirected to your dashboard in a few seconds.",
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            "Skip",
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
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierColor: Color.fromARGB(192, 3, 23, 41),
                            builder: (context) => SuccessDialog(
                              willRedirect: true,
                              redirectFunction: () async {
                                await AppLocalStorage.setHasBeenOnboarded(true);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppNaviagtor()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              message:
                                  "Your account is ready to use. You will be redirected to your dashboard in a few seconds.",
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
                  ],
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
