import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:dev_quiz/shared/models/quiz/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

class HomeRepository {
  Future<List<QuizModel>> getQuizzes() async{
    await Future.delayed(Duration(seconds: 2));
    final response = await rootBundle.loadString('database/quizzes.json');

    final responseMap = jsonDecode(response) as List;
    final quizzes = responseMap.map(
      (quiz) => QuizModel.fromMap(quiz)
    ).toList();

    return quizzes;
  }

  Future<UserModel> getUser() async{
    await Future.delayed(Duration(seconds: 2));
    final response = await rootBundle.loadString('database/user.json');
    final user = UserModel.fromJson(response);
    return user;
  }
}