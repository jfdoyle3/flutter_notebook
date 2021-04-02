import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {


  // You can const a variable or the list
  // if there's a const on the list you can't add anymore items.
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
                  {'text': 'Black', 'score':7},
                  {'text':'Red','score':5},
                  {'text': 'Blue','score': 6},
                  {'text':'Grey','score':10},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
                  {'text':'Dog','score':7},
                  {'text':'Cat','score': 9},
                  {'text':'Rat','score': 1},
                  {'text':'Rabbit','score': 5},
                  ],
    },
    {
      'questionText': 'What\'s your favorite number?',
      'answers': [
                  {'text':'7','score':7},
                  {'text':'13','score':9},
                  {'text':'8','score':8},
                  {'text':'100','score':10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
  setState(() {
     _questionIndex=0;
     _totalScore=0;
  });
  }

  void _answerQuestion(int score) {

    _totalScore+=score;
    setState(() {
      _questionIndex++;
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('We have more questions...');
      } else {
        print('No more questions.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App title '),
        ),
        // You can only pass ONE Widget in Body:
        // try using Row
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion,
                   questionIndex: _questionIndex,
                   questions: _questions )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
