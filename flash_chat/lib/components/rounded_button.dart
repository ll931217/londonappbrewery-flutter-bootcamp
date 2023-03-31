import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Color backgroundColor;
  String text;
  void Function()? onPressed;
  RoundedButton({ super.key, required this.backgroundColor, required this.text, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}

