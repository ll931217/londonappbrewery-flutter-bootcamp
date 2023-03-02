import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  final player = AudioPlayer();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget xyloKey(Color color, int index) {
      return Expanded(
        child: TextButton(
          onPressed: () async {
            await player.play(AssetSource('note$index.wav'));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: Text(
            '$index',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xyloKey(Colors.red, 1),
              xyloKey(Colors.orange, 2),
              xyloKey(Colors.yellow, 3),
              xyloKey(Colors.green, 4),
              xyloKey(Colors.teal, 5),
              xyloKey(Colors.blue, 6),
              xyloKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
