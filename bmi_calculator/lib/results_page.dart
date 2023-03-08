import 'package:flutter/material.dart';

import 'const.dart';
import 'calculator_brain.dart';

import 'components/card.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: CustomCard(
              colour: coloursMap['active']['cardBackground'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: coloursMap['inactive']['text'],
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(coloursMap['accent']),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(34)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'RE-CALCULATE',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
