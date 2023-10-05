import 'package:flutter/material.dart';
import 'package:quiz_app/data/list_question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
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
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    selectedAnswer = [];
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
        restartQuiz: restartQuiz,
      );
    }

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
          child: screenWidget,
        ),
      ),
    );
  }
}
