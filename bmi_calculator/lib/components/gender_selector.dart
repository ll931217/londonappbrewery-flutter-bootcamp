import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key, required this.coloursMap, required this.gender, required this.onPress});

  final Map coloursMap;
  final Gender gender;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            gender == Gender.male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
            size: 80.0,
            color: coloursMap['inactive']['text'],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            gender.name.toUpperCase(),
            style: TextStyle(
              fontSize: 18.0,
              color: coloursMap['inactive']['text'],
            ),
          ),
        ],
      ),
    );
  }
}
