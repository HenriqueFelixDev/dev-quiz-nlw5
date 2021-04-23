import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/quiz/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;

  AnswerWidget({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: isSelected ? _selectedBorderCardRight : AppColors.border )
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? _selectedColorCardRight : AppColors.white
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                answer.title, 
                style: isSelected ? _selectedTextStyleRight : AppTextStyles.body
              )
            ),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : Colors.transparent,
                border: isSelected 
                  ? null 
                  : Border.fromBorderSide(BorderSide(color: AppColors.border)),
                borderRadius: BorderRadius.circular(100.0)
              ),
              child: isSelected 
                ? Icon(_selectedIconRight, size: 12.0, color: Colors.white)
                : null
            )
          ],
        )
      ),
    );
  }
}