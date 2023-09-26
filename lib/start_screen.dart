import 'package:flutter/material.dart';
import 'package:quiz_app/title.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.activeScreen, {Key? key}) : super(key: key);
  final void Function() activeScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 350,
          ),
          const SizedBox(
            height: 40,
          ),
          const TitleScreen('Learn Flutter the fun way', Colors.white, 28),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
              onPressed: activeScreen,
              icon: const Icon(Icons.arrow_right_alt),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}
