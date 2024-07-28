import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatefulWidget {
  final String pageName;
  const PageHeader({
    super.key,
    required this.pageName,
  });

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.pageName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'NunitoBold',
          ),
        ),
        ValueListenableBuilder(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, child) {
              return Image.asset(
                mode.isLight ? "assets/mpay-dark.png" : "assets/mpay.png",
                height: 40,
              );
            }),
      ],
    );
  }
}
