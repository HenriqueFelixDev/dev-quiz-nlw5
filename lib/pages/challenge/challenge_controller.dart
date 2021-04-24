import 'package:dev_quiz/shared/models/quiz/answer_model.dart';
import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier(0);
  int get currentQuestion => currentQuestionNotifier.value + 1;
  int get currentQuestionIndex => currentQuestionNotifier.value;
  set currentQuestion(int newValue) => currentQuestionNotifier.value = newValue;

  int _rightAnswersCount = 0;
  int get rightAnswersCount => _rightAnswersCount;

  void updateRightAnswers(AnswerModel answer) {
    if(answer.isRight) {
      _rightAnswersCount++;
    }
  }
}