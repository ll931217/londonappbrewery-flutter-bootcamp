import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/me.jpg'),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'Liang-Shih Lin',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'FULL STACK DEVELOPER',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Comfortaa',
                    color: Colors.white60,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                const Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                      size: 25.0,
                      semanticLabel: 'Phone number',
                    ),
                    title: Text(
                      '0987654321',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.teal,
                      size: 25.0,
                      semanticLabel: 'Phone number',
                    ),
                    title: Text(
                      'example@gmail.com',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
