import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.amber[300],
          appBar: AppBar(
            title: Text('I Am Poor'),
            backgroundColor: Colors.amber[900],
          ),
          body: const Center(
            child: Image(
              image: AssetImage('images/beggar.png'),
            ),
          ),
        ),
      ),
  );
}