import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';
import '../chart_progress/chart_progress_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double score;
  ScoreCardWidget({
    Key? key,
    this.score = 0.0
  }) : super(key: key);

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
            child: ChartProgressWidget(progress: score),
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