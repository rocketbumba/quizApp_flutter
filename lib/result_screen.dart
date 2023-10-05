import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary_screen.dart';

import 'data/list_question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int numberQuestion = questions.length;
    final int correctAnswer = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswer out $numberQuestion question correstly',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummaryScreen(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt),
              onPressed: () {
                restartQuiz();
              },
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
