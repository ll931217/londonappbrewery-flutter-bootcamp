import 'dart:math';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'results_page.dart';

import 'components/card.dart';
import 'components/gender_selector.dart';
import 'components/unit_selector.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  double height = 100.0;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    colour: coloursMap[gender == Gender.male ? 'active' : 'inactive']['cardBackground'],
                    child: GenderSelector(
                      coloursMap: coloursMap,
                      gender: Gender.male,
                      onPress: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    colour: coloursMap[gender == Gender.female ? 'active' : 'inactive']['cardBackground'],
                    child: GenderSelector(
                      coloursMap: coloursMap,
                      gender: Gender.female,
                      onPress: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: CustomCard(
              colour: coloursMap['inactive']['cardBackground'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: coloursMap['inactive']['text'],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 80.0,
                          color: coloursMap['active']['text'],
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: coloursMap['inactive']['text'],
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 25.0),
                      activeTrackColor: coloursMap['active']['text'],
                      inactiveTrackColor: coloursMap['inactive']['text'],
                      thumbColor: coloursMap['accent'],
                      overlayColor: coloursMap['accent_faded'],
                    ),
                    child: Slider(
                      value: height,
                      min: 1.0,
                      max: 250.0,
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    colour: coloursMap['inactive']['cardBackground'],
                    child: UnitSelector(
                      title: 'WEIGHT',
                      unit: weight.toString(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: coloursMap['active']['cardBackground'],
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      children: [
                        {
                          'onPressed': () {
                            setState(() {
                              weight--;
                            });
                          },
                          'icon': const Icon(Icons.remove),
                        },
                        {
                          'onPressed': () {
                            setState(() {
                              weight++;
                            });
                          },
                          'icon': const Icon(Icons.add),
                        }
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    colour: coloursMap['inactive']['cardBackground'],
                    child: UnitSelector(
                      title: 'AGE',
                      unit: age.toString(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: coloursMap['active']['cardBackground'],
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      children: [
                        {
                          'onPressed': () {
                            setState(() {
                              age--;
                            });
                          },
                          'icon': const Icon(Icons.remove),
                        },
                        {
                          'onPressed': () {
                            setState(() {
                              age++;
                            });
                          },
                          'icon': const Icon(Icons.add),
                        }
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: coloursMap['accent'],
              padding: const EdgeInsets.all(44),
            ),
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              setState(() {
                // Reset values
                gender = Gender.male;
                height = 100.0;
                weight = 40;
                age = 10;
              });

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Results(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getDescription(),
                ))
              );
            },
            child: const Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(
                fontSize: 18.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}

