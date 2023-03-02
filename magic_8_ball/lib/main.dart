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
        appBar: AppBar(
          title: const Text('Ask Me Anything'),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: const [
                Expanded(
                  child: Ball(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  var random = Random();
  int option = 1;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          option = random.nextInt(5) + 1;
        });
      },
      child: Image.asset('images/ball$option.png'),
    );
  }
}
