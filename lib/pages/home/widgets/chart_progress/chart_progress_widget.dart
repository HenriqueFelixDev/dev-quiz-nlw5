import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';

class ChartProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80.0,
              width: 80.0,
              child: CircularProgressIndicator(
                value: 0.75,
                strokeWidth: 10.0,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            )
          ),
          Center(
            child: Text('75%', style: AppTextStyles.heading)
          )
        ]
      )
    );
  }
}