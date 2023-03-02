import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool answer, BuildContext context) {
    if (!quizBrain.checkQuestionDisabled()) {
      IconData icon = Icons.check;
      Color color = Colors.green;

      if (!quizBrain.checkAnswer(answer)) {
        icon = Icons.close;
        color = Colors.red;
      }

      setState(() {
        scoreKeeper.add(Icon(icon, color: color));
      });

      quizBrain.nextQuestion(context, (bool finished, List<Question> questions, int currentQuestion) {
        setState(() {
          for (int i = 0; i < questions.length; i++) {
            questions[i].enableQuestion();
          }
          currentQuestion = 0;
          scoreKeeper.clear();
        });
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(
                !quizBrain.checkQuestionDisabled() ?
                Colors.green : Colors.grey,
              )),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true, context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(
                !quizBrain.checkQuestionDisabled() ?
                Colors.red : Colors.grey,
              )),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false, context);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
