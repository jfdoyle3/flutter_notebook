import 'package:flutter/material.dart';

import './question.dart';
import './answers.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex=0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
      print(_questionIndex);
    });

  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {'questionText':'What\'s your favorite color?',
       'answers': ['Black','Red','Blue','Grey'],
      },
      {'questionText':'What\'s your favorite animal?',
        'answers': ['Dog','Cat','Rat','Rabbit'],
      },
      {'questionText':'What\'s your favorite number?',
        'answers': ['7','13','8','100'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App title '),
        ),
        // You can only pass ONE Widget in Body:
        // try using Row
        body: Column(
          children: [
            Question(
                questions[_questionIndex]['questionText']
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()
            // 1) Anonymous Function
            // ElevatedButton(
            //     onPressed: () => print('Answer 2 Chosen!'),
            //     child: Text('Answer 2')),
            // 2) Anonymous Function
            // ElevatedButton(
            //     onPressed: (){
            //       // some code
            //       print('Answer 3 chosen');
            //     },
          ],
        ),
      ),
    );
  }
}
