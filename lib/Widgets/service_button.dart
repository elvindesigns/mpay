import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceButton extends StatelessWidget {
  final IconData icon;
  final Color buttonColor;
  final Color? textColor;
  final String text;
  final double iconSize;
  final double textSize;
  final double radius;

  const ServiceButton({
    super.key,
    required this.icon,
    required this.buttonColor,
    required this.text,
    required this.iconSize,
    required this.textSize,
    this.textColor,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: buttonColor.withOpacity(0.15),
          child: Center(
            child: FaIcon(
              icon,
              color: buttonColor,
              size: iconSize,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            // fontFamily: 'NunitoBold',
            fontSize: textSize,
            color: textColor ?? null,
          ),
        )
      ],
    );
  }
}
