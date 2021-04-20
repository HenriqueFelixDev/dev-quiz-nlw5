import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/pages/home/widgets/chart_progress_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.0,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 32.0),
            child: ChartProgressWidget(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vamos começar!',
                  style: AppTextStyles.heading
                ),
                Text(
                  'Complete os desafios e avance em conhecimento',
                  style: AppTextStyles.body
                ),
              ]
            )
          )
        ]
      )
    );
  }
}