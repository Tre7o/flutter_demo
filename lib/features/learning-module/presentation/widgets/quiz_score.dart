// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class QuizScore extends StatelessWidget {
  final int quizScore;
  final Function resetHandler;

  const QuizScore(this.quizScore, this.resetHandler, {Key? key})
      : super(key: key);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (quizScore >= 41) {
      resultText = 'You are awesome!';
      print(quizScore);
    } else if (quizScore >= 31) {
      resultText = 'This is good!';
      print(quizScore);
    } else if (quizScore >= 21) {
      resultText = 'You need to learn more!';
    } else if (quizScore >= 1) {
      resultText = 'A bit weak!';
    } else {
      resultText = 'This is a poor score!';
      print(quizScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$quizScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(


            onPressed: ()=>resetHandler(),

            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          //   child: Text(
          //     'Restart Quiz!',
          //   ), //Text
          //   textColor: Colors.blue,
          //   onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}