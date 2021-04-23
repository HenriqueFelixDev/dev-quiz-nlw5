import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String icon;
  final int questionsCount;
  final int completedQuestionsCount;
  final VoidCallback onTap;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.questionsCount,
    required this.completedQuestionsCount,
    required this.onTap
  }) : assert(completedQuestionsCount <= questionsCount),
      super(key: key);

  double get _quizProgress => 
    questionsCount == 0 ? 0 : completedQuestionsCount / questionsCount;
                  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(icon),
            Text(title, style: AppTextStyles.heading),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$completedQuestionsCount/$questionsCount', 
                    style: AppTextStyles.body
                  )
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: _quizProgress)
                )
              ]
            )
          ]
        )
      ),
    );
  }
}