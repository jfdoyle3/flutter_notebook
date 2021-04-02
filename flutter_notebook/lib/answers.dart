import 'package:flutter/material.dart';

class Answer extends StatelessWidget{
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: selectHandler,
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
        ),
      );
  }
}