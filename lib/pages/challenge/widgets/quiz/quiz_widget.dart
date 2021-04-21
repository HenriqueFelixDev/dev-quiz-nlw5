import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import '../answer/answer_widget.dart';

class QuizWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O que o Flutter faz em sua totalidade?',
            style: AppTextStyles.heading
          ),
          SizedBox(height: 28.0),
          AnswerWidget(label: 'Kit de desenvolvimento de interface de usuário'),
          AnswerWidget(label: 'Possibilita a criação de aplicativos compilados nativamente', isSelected: true,),
          AnswerWidget(label: 'Acho que é uma marca de café do Himalaia', isSelected: true, isRight: true,),
          AnswerWidget(label: 'Possibilita a criação de desktops que são muito incríveis'),
        ]
      ) 
    );
  }
}