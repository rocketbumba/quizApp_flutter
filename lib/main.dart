import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple,
          Colors.deepOrange,
        ])),
        child: const QuizScreen(),
      ),
    ),
  ));
}
