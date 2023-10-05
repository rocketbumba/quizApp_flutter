import 'package:flutter/material.dart';

class QuestionSummaryScreen extends StatelessWidget {
  const QuestionSummaryScreen({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  final Color rightAnswerColor = Colors.blue;
  final Color roundAnswerColor = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: data['correct_answer'] == data['user_answer']
                            ? rightAnswerColor
                            : roundAnswerColor,
                        width: 10,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Text(
                      (data['question_index'] as int).toString(),
                      style: TextStyle(
                        backgroundColor:
                            (data['correct_answer'] == data['user_answer'])
                                ? rightAnswerColor
                                : roundAnswerColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Colors.blue,
                            )),
                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                              color:
                                  data['correct_answer'] == data['user_answer']
                                      ? rightAnswerColor
                                      : roundAnswerColor),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
