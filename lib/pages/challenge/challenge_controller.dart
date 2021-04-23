import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier(0);
  int get currentQuestion => currentQuestionNotifier.value + 1;
  int get currentQuestionIndex => currentQuestionNotifier.value;
  set currentQuestion(int newValue) => currentQuestionNotifier.value = newValue;
}