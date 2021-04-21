import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_colors.dart';
import '../level_chip/level_chip_widget.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({Key? key, required this.label})
    : assert(_config.keys.contains(label)), 
      super(key: key);

  static final _config = {
    "Fácil": {
      'background': AppColors.levelButtonFacil,
      'text': AppColors.levelButtonTextFacil,
      'border': AppColors.levelButtonBorderFacil
    },
    "Médio": {
      'background': AppColors.levelButtonMedio,
      'text': AppColors.levelButtonTextMedio,
      'border': AppColors.levelButtonBorderMedio
    },
    "Difícil": {
      'background': AppColors.levelButtonDificil,
      'text': AppColors.levelButtonTextDificil,
      'border': AppColors.levelButtonBorderDificil
    },
    "Perito": {
      'background': AppColors.levelButtonPerito,
      'text': AppColors.levelButtonTextPerito,
      'border': AppColors.levelButtonBorderPerito
    }
  };

  Color get _backgroundColor => _config[label]!['background']!;
  Color get _textColor => _config[label]!['text']!;
  Color get _borderColor => _config[label]!['border']!;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LevelChipWidget(
        label: label,
        labelStyle: TextStyle(color: _textColor),
        borderColor: _borderColor,
        backgroundColor: _backgroundColor
      )
    );
  }
}