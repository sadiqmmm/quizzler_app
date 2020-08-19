import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzler App",
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Quizzler App"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzlerApp(),
          ),
        ),
      ),
    );
  }
}

class QuizzlerApp extends StatefulWidget {
  @override
  _QuizzlerAppState createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  List<Icon> scoreKeeper = [];

  List<bool> answers = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == true) {
                  print("Right!");
                } else {
                  print("Wrong!");
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              child: Text('True'),
              textColor: Colors.white,
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == false) {
                  print("Right!");
                } else {
                  print("Wrong!");
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              child: Text('False'),
              textColor: Colors.white,
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
