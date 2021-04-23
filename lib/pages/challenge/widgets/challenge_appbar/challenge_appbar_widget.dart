import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class ChallengeAppBarWidget extends StatelessWidget {
  final int currentQuestion;
  final int questionsCount;

  ChallengeAppBarWidget({
    Key? key,
    required this.currentQuestion,
    required this.questionsCount
  }) 
  : assert(currentQuestion <= questionsCount),
    assert(questionsCount> 0), 
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
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
          ]
        )
      )
    );
  }
}