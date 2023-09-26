import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  final String title;
  final Color fontColor;
  final double fontSize;
  const TitleScreen(this.title, this.fontColor, this.fontSize, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
      ),
    );
  }
}
