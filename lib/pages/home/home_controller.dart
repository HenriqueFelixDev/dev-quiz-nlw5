import 'package:flutter/material.dart';
import 'package:dev_quiz/shared/models/quiz/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'home_repository.dart';

enum HomeState {
  loading, success, error, empty
}

class HomeController {
  final _homeRepository = HomeRepository();

  ValueNotifier<HomeState> stateNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<QuizModel>? _quizzes;
  List<QuizModel>? get quizzes => _quizzes;

  UserModel? _user;
  UserModel? get user => _user;

  void getQuizzes() {
    state = HomeState.loading;
    _homeRepository.getQuizzes()
      .then((quizzes) {
        _quizzes = quizzes;
        state = HomeState.success;
      })
      .catchError((e) {
        state = HomeState.error;
      });
  }

  void getUser() {
    state = HomeState.loading;
        _homeRepository.getUser()
      .then((user) {
        _user = user;
        state = HomeState.success;
      })
      .catchError((e) {
        state = HomeState.error;
      });
  }
}