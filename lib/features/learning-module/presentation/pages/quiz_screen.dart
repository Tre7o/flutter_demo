import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/appbar.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../widgets/quiz_score.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = const [
    {'image': 'assets/gestures/C.jpg', 'correctAnswer': 'C'},
    {'image': 'assets/gestures/H.jpg', 'correctAnswer': 'H'},
    {'image': 'assets/gestures/S.jpg', 'correctAnswer': 'S'},
    {'image': 'assets/gestures/K.jpg', 'correctAnswer': 'K'},
    {'image': 'assets/gestures/F.jpg', 'correctAnswer': 'F'},
    {'image': 'assets/gestures/R.jpg', 'correctAnswer': 'R'},
    {'image': 'assets/gestures/E.jpg', 'correctAnswer': 'E'},
    {'image': 'assets/gestures/I.jpg', 'correctAnswer': 'I'},
    {'image': 'assets/gestures/R.jpg', 'correctAnswer': 'R'},
    {'image': 'assets/gestures/D.jpg', 'correctAnswer': 'D'},
  ];

  final TextEditingController _controller = TextEditingController();

  final _formKEY = GlobalKey<FormState>();

  var _questionIndex = 0;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _verifyAnswer() {
    setState(() {
      if (_controller.text.toUpperCase() ==
          _questions[_questionIndex]['correctAnswer'].toUpperCase()) {
        Get.snackbar("Correct", "You got it right.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[100],
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8),
            colorText: Colors.green);
        _totalScore += 5;
      } else {
        Get.snackbar("Incorrect", "You got it wrong.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8),
            colorText: Colors.red);
        _totalScore += 0;
      }
    });
  }

  void _displayNextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _controller.clear();
    });
  }

  int displayQuestionNumber() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    return _questionIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: "Quiz",
        leadingWidget: BackButton(color: Colors.black),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    if (_questionIndex < _questions.length) {
      int questionCounter = _questionIndex + 1;
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Attempting $questionCounter question of ${_questions.length}"),
            const SizedBox(
              height: 30,
            ),
            // Display the question text
            const Text(
              "Guess the Letter!",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            // Display the image
            SizedBox(
              width: 300,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 7,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Image.asset(_questions[_questionIndex]['image'],
                        fit: BoxFit.cover,
                        width: 300.0,
                        height: 400.0,
                        alignment: Alignment.center),
                  ),
                ),
              ),
            ),

            //Input Answer container
            const SizedBox(height: 50.0),
            Form(
                key: _formKEY,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      decoration: textInputDecoration.copyWith(
                          label: const Text('Your answer')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide an answer";
                        }
                        final RegExp regex = RegExp(r'^[a-zA-Z]+$');
                        if (!regex.hasMatch(value)) {
                          return 'Please enter only letters (uppercase or lowercase)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Submit button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKEY.currentState!.validate()) {
                              _verifyAnswer();
                            }
                          },
                          child: const Text('Submit'),
                        ),

                        //Next button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKEY.currentState!.validate()) {
                              _displayNextQuestion();
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      );
    } else {
      return QuizScore(_totalScore, _resetQuiz);
    }
  }
}
