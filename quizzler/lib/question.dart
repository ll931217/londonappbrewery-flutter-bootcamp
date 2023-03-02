class Question {
  late String question;
  late bool answer;
  late bool correctAnswer;
  late bool disable;

  Question(this.question, this.answer, { this.disable = false });

  bool checkAnswer(bool answer) {
    correctAnswer = answer == this.answer;
    return correctAnswer;
  }

  void disableQuestion() {
    disable = true;
  }

  void enableQuestion() {
    disable = false;
  }
}
