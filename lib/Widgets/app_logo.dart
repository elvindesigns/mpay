import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) => Image.asset(
        mode.isLight ? "assets/mpay-dark.png" : "assets/mpay.png",
        height: 40,
      ),
    );
  }
}
