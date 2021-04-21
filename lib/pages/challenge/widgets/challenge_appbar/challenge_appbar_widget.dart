import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class ChallengeAppBar extends PreferredSize {
  final int currentQuestion;
  final int questionsCount;

  ChallengeAppBar({
    Key? key,
    required this.currentQuestion,
    required this.questionsCount
  }) 
  : assert(currentQuestion <= questionsCount),
    assert(questionsCount> 0), 
    super(
      key: key,
      preferredSize: Size.fromHeight(150.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão ' + currentQuestion.toString().padLeft(2, '0'), 
                  style: AppTextStyles.body
                ),
                Text(
                  'de ' + questionsCount.toString().padLeft(2, '0'), 
                  style: AppTextStyles.body
                ),
              ]
            ),
            SizedBox(height: 16.0),
            ProgressIndicatorWidget(value: currentQuestion / questionsCount)
          ],
        )
      )
    );
}