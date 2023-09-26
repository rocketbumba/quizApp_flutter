import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  List<String> selectedAnswer = [];
  String activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
  }

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepOrange,
            ],
          )),
          child: activeScreen == 'start-screen'
              ? StartScreen(changeScreen)
              : QuestionScreen(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
