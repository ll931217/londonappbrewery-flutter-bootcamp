import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/data/tasks.dart';

import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const Todoey());
}

class Todoey extends StatelessWidget {
  const Todoey({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Tasks(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen()
      ),
    );
  }
}

