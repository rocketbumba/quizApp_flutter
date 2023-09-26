import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.textAnswer, required this.onTap, Key? key})
      : super(key: key);
  final String textAnswer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      onPressed: onTap,
      child: Text(
        textAnswer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
