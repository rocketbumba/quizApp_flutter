import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton(this.titleButton, {Key? key}) : super(key: key);
  final String titleButton;

  void startAcction() {}
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: startAcction,
      icon: const Icon(Icons.arrow_right_alt),
      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
      label: Text(titleButton),
    );
  }
}
