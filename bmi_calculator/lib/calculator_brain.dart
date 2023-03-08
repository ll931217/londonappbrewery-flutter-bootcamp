import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight
  });

  final double height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'underweight';
    } else if (18.5 <= _bmi && _bmi <= 24.9) {
      return 'healthy';
    } else if (25 <= _bmi && _bmi <= 29.9) {
      return 'overweight';
    } else {
      return 'obese';
    }
  }

  String getDescription() {
    if (_bmi < 18.5) {
      return 'You have a lower than normal weight. Please eat more or exercise to eat more.';
    } else if (18.5 <= _bmi && _bmi <= 24.9) {
      return 'You are healthy!';
    } else if (25 <= _bmi && _bmi <= 29.9) {
      return 'You have a higher than normal weight. Please exercise more.';
    } else {
      return 'Please find a dietrician to health guide you on the path to weight loss.';
    }
  }
}
