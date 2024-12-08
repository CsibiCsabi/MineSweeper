import 'dart:ffi';

import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(
      {required this.highscore,
      required this.restart,
      required this.won,
      required this.score,
      super.key});

  final bool won;

  final int score;

  final Function() restart;

  final highscore;

  final myButton = const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 21, 19, 33)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w400, fontSize: 20)));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        Text(
          won ? "You've won! W!" : "You lost! L!",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 21, 19, 33),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5,),
        Text(
          "your score: ${score.toString()}",
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 21, 19, 33),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: myButton,
          onPressed: restart,
          child: Text("Restart!"),
        ),
        SizedBox(
          height: 500,
        ),
        Text(
          "highscore: ${highscore.toString()}",
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 21, 19, 33),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
