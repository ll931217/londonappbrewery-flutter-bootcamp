import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      )
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({ Key? key }) : super(key: key);

  @override
  State<DicePage> createState() => _DiceState();
}

class _DiceState extends State<DicePage> {
  var random = Random();
  int min = 1;
  int max = 6;
  int leftNumber = 1;
  int rightNumber = 1;

  void randomizeNumbers() {
    setState(() {
      leftNumber = random.nextInt(max) + min;
      rightNumber = random.nextInt(max) + min;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                randomizeNumbers();
              },
              child: Image.asset('images/dice$leftNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  randomizeNumbers();
                },
                child: Image.asset('images/dice$rightNumber.png')
            ),
          ),
        ],
      ),
    );
  }
}
