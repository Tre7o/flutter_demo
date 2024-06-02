import 'package:flutter/material.dart';
import 'package:flutter_demo/features/learning-module/presentation/QuizScore.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = const [
    {
      'image': 'assets/gestures/C.jpg',
      'correctAnswer' : 'C'
    },
    {
      'image': 'assets/gestures/H.jpg',
      'correctAnswer' : 'H'
    },
    {
      'image': 'assets/gestures/S.jpg',
      'correctAnswer' : 'S'
    },
    {
      'image': 'assets/gestures/K.jpg',
      'correctAnswer' : 'K'
    },
    {
      'image': 'assets/gestures/F.jpg',
      'correctAnswer' : 'F'
    },
    {
      'image': 'assets/gestures/R.jpg',
      'correctAnswer' : 'R'
    },
    {
      'image': 'assets/gestures/E.jpg',
      'correctAnswer' : 'E'
    },
    {
      'image': 'assets/gestures/I.jpg',
      'correctAnswer' : 'I'
    },
    {
      'image': 'assets/gestures/R.jpg',
      'correctAnswer' : 'R'
    },
    {
      'image': 'assets/gestures/D.jpg',
      'correctAnswer' : 'D'
    },
  ];

  final TextEditingController _controller = TextEditingController();

  String _message = '';

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
      if (_controller.text.toUpperCase() == _questions[_questionIndex]['correctAnswer'].toUpperCase()) {
        _message = 'Correct!';
        _totalScore += 5;
      } else {
        _message = 'Incorrect, try again.';
        _totalScore += 0;
      }
    });
  }

  void _displayNextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _controller.clear();
      _message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffA7D397),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quick Sign Learning"),
          elevation: 5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            _buildBody(),
          ]
        ), //Padding
      ); //Scaffold
      //debugShowCheckedModeBanner: false;
  }

   Widget _buildBody()
  {
    if (_questionIndex < _questions.length) {
      return Column(
       children: [
          // Display the question text
           Text(
            "Guess the Letter!",
            style: TextStyle(fontSize: 30, color: Colors.green.shade900),
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
          SizedBox(height: 20.0),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your Answer',
            ),
          ),

          //Submit button container
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _verifyAnswer,
            child: Text('Submit'),
          ),

          //Verification message container
          SizedBox(height: 20.0),
          Text(
            _message,
            style: TextStyle(fontSize: 18.0, color: Colors.red),
          ),

          //Next button container
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _displayNextQuestion,
            child: Text('Next'),
          ),

        ],
      );
    } else {
      return QuizScore(_totalScore, _resetQuiz);
    }
  }

}