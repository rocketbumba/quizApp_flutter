import 'package:flutter/material.dart';

import 'answer_button.dart';
import 'data/list_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.onSelectAnswer})
      : super(key: key);
  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentPositionQuestion = 0;
  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentPositionQuestion = currentPositionQuestion + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(currentPositionQuestion);
    final currentQuestion = questions[currentPositionQuestion];

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                textAnswer: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
