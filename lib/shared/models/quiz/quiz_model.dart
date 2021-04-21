import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'question_model.dart';

enum Level {
  facil, medio, dificil, perito
}

extension StringExt on String {
  Level get level => {
    "facil": Level.facil,
    "medio": Level.medio,
    "dificil": Level.dificil,
    "perito": Level.perito,
  }[this]!;
}

extension LevelExt on Level {
  String get stringValue => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito",
  }[this]!;
}

class QuizModel {
  final String title;
  final int questionsAnswered;
  final String icon;
  final Level level;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    this.questionsAnswered = 0,
    required this.icon,
    required this.level,
    required this.questions,
  });

  QuizModel copyWith({
    String? title,
    int? questionsAnswered,
    String? icon,
    Level? level,
    List<QuestionModel>? questions,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      icon: icon ?? this.icon,
      level: level ?? this.level,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questionsAnswered': questionsAnswered,
      'icon': icon,
      'level': level.stringValue,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questionsAnswered: map['questionsAnswered'],
      icon: map['icon'],
      level: map['level'].toString().level,
      questions: List<QuestionModel>.from(
        map['questions']?.map((x) => QuestionModel.fromMap(x)) ?? []
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questionsAnswered: $questionsAnswered, icon: $icon, level: $level, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizModel &&
      other.title == title &&
      other.questionsAnswered == questionsAnswered &&
      other.icon == icon &&
      other.level == level &&
      listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      questionsAnswered.hashCode ^
      icon.hashCode ^
      level.hashCode ^
      questions.hashCode;
  }
}
