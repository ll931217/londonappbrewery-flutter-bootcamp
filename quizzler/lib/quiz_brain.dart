import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './question.dart';

class QuizBrain {
  final List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];
  int _currentQuestion = 0;

  String getQuestion() {
    return _questions[_currentQuestion].question;
  }

  bool checkQuestionDisabled() {
    return _questions[_currentQuestion].disable;
  }

  bool checkAnswer(bool answer) {
    return _questions[_currentQuestion].checkAnswer(answer);
  }

  void nextQuestion(BuildContext context, Function callback) {
    if (_questions.length - 1 > _currentQuestion) {
      _currentQuestion++;
    } else {
      int correct = 0;

      for (int i = 0; i < _questions.length; i++) {
        if (_questions[i].correctAnswer) {
          correct++;
        }
        _questions[i].disableQuestion();
      }

      Alert(
        context: context,
        title: 'End of Quiz',
        desc: 'You got ${correct.toString()} out of ${_questions.length.toString()} questions.',
        buttons: [
          DialogButton(
              onPressed: () {
                callback(true, _questions, _currentQuestion);
              },
              color: Colors.blue,
              radius: BorderRadius.circular(0.0),
              child: const Text(
                'Restart',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
          ),
        ],
      ).show();
    }
  }
}