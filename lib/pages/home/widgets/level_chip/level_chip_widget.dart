import 'package:flutter/material.dart';

class LevelChipWidget extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle? labelStyle;
  
  LevelChipWidget({
    Key? key, 
    required this.label,
    this.borderColor = Colors.black54,
    this.backgroundColor = Colors.white,
    this.labelStyle
  }) : super(key: key);

  TextStyle get _labelTextStyle => labelStyle ?? TextStyle();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26.0, 
        vertical: 6.0
      ),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28.0),
        color: backgroundColor
      ),
      child: Text(label, style: _labelTextStyle)
    );
  }
}