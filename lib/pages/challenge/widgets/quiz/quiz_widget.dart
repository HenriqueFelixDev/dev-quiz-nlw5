import 'dart:math';

import 'package:dev_quiz/shared/models/quiz/answer_model.dart';
import 'package:dev_quiz/shared/models/quiz/question_model.dart';
import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import '../answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final Function(AnswerModel answer)? onAnswerSelect;

  QuizWidget({
    Key? key,
    required this.question,
    this.onAnswerSelect
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int selectedQuestionIndex = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading
          ),
          SizedBox(height: 28.0),
          ...List.generate(
            widget.question.answers.length,
            (index) {
              return AnswerWidget(
                answer: answer(index),
                isSelected: selectedQuestionIndex == index,
                onTap: () {
                  if (selectedQuestionIndex == -1) {
                    setState(() => selectedQuestionIndex = index);
                    widget.onAnswerSelect?.call(answer(index));
                  }
                },
              );
            }
          )
        ]
      ) 
    );
  }
}