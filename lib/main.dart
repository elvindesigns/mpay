import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpay/brand/colors.dart';
import 'package:mpay/screens/Auth/Controller/local_storage.dart';
import 'package:mpay/screens/Auth/UI/login_pin.dart';
import 'package:mpay/screens/onboarding.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: BrandColors().blue,
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  bool isOnboarded = false;
  @override
  void initState() {
    checkHasBeenOnboarded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return AdaptiveTheme(
        light: ThemeData(
          useMaterial3: true,
          fontFamily: 'NunitoRegular',
          brightness: Brightness.light,
          colorSchemeSeed: BrandColors().blue,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: BrandColors().blue.withOpacity(0.04),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        dark: ThemeData(
          useMaterial3: true,
          fontFamily: 'NunitoRegular',
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white.withOpacity(0.05),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        ),
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'mPay',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : isOnboarded
                  ? LoginPINScreen()
                  : OnboardingScreen(),
        ),
      );
    });
  }

  Future<bool> getOnboarded() async {
    bool hasOnboarded = await AppLocalStorage.getHasBeenOnboarded();
    return hasOnboarded;
  }

  Future<void> checkHasBeenOnboarded() async {
    bool hasOnboarded = await getOnboarded();
    setState(() {
      isLoading = false;
      isOnboarded = hasOnboarded;
    });
  }
}
