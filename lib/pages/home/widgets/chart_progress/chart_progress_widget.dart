import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';

class ChartProgressWidget extends StatelessWidget {
  final double progress;
  ChartProgressWidget({
    Key? key,
    this.progress = 0.0
  }) 
    : assert(progress >= 0.0 && progress <= 1.0),
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: progress),
        duration: Duration(seconds: 2),
        curve: Curves.decelerate,
        builder: (_, value, __) {
          return Stack(
            children: [
              Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 10.0,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                )
              ),
              Center(
                child: Text('${(value * 100).round()}%', style: AppTextStyles.heading)
              )
            ]
          );
        }
      )
    );
  }
}