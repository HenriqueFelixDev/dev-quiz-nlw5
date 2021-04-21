import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';

class AnswerWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isRight;

  AnswerWidget({
    Key? key,
    required this.label,
    this.isSelected = false,
    this.isRight = false
  }) : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              label, 
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
    );
  }
}