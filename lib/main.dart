import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

//StatefulWidgetであるMyAppウィジェットを受け取って画面にUI表示するmainメソッド
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override

  //stateクラスを受け取ってMyAppの「状態（state）」を生成する
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//stateを継承しているのでこのクラスはMyAppの「状態」を保持しているクラス
class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < questions.length) {}

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            //Create a list of Answer widgets and display them on the screen
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
