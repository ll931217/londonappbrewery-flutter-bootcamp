import 'package:flutter/material.dart';
import '../const.dart';

class UnitSelector extends StatelessWidget {
  const UnitSelector({
    super.key,
    required this.title,
    required this.unit,
    required this.style,
    required this.children,
  });

  final String title;
  final String unit;
  final ButtonStyle style;
  final List<Map> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: coloursMap['inactive']['text'],
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            fontSize: 80.0,
            color: coloursMap['active']['text'],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children.map((child) => ElevatedButton(
            onPressed: child['onPressed'],
            style: style,
            child: child['icon'],
          )).toList(),
        )
      ],
    );
  }
}
