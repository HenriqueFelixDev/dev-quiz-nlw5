import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color pressedColor;
  final Color borderColor;
  final Color textColor;

  BottomActionButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.pressedColor = const Color(0xFFCCCCCC),
    this.borderColor = const Color(0xFFBBBBBB),
    this.textColor = const Color(0xFF333333)
  }) : super(key: key);

  BottomActionButtonWidget.green({
    required this.label, 
    required this.onTap
  })
    : this.backgroundColor = AppColors.darkGreen,
      this.pressedColor = AppColors.green,
      this.borderColor = AppColors.darkGreen,
      this.textColor = AppColors.white;

  BottomActionButtonWidget.white({
    required this.label, 
    required this.onTap
  })
    : this.backgroundColor = AppColors.white,
      this.pressedColor = AppColors.lightGreen,
      this.borderColor = AppColors.border,
      this.textColor = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.all(pressedColor.withOpacity(0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: borderColor)
          )),
        ),
        child: Text(label, style: GoogleFonts.notoSans(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: textColor
        )),
        onPressed: onTap
      )
    );
  }
}