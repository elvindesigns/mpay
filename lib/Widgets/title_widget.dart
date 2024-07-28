import 'package:flutter/widgets.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 35,
        fontFamily: 'NunitoBold',
        height: 1.2,
      ),
    );
  }
}
