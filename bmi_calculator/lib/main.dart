import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0C22),
          elevation: 10.0,
          shadowColor: Colors.black,
        ),
        primaryColor: const Color(0xFF0A0C22),
        scaffoldBackgroundColor: const Color(0xFF0A0C22),
      ),
      home: const InputPage(),
    );
  }
}

