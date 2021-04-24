import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/bottom_action_button/bottom_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FeedbackPage extends StatelessWidget {
  final String title;
  final int questionsCount;
  final int rightAnswersCount;

  FeedbackPage({
    Key? key,
    required this.title,
    required this.questionsCount,
    required this.rightAnswersCount
  }) : super(key: key);

  _shareResult() {
    Share.share(
      '''
        DevQuiz NLW 5:\n 
        Realizei o quiz $title e obtive 
        ${(rightAnswersCount / questionsCount * 100).toInt()} 
        de aproveitamento
      '''
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.0,
            child: Image.asset(AppImages.trophy),
          ),
          Column(
            children: [
              Text(
                'Parabéns',
                style: AppTextStyles.heading40
              ),
              SizedBox(height: 16.0),
              Text.rich(
                TextSpan(
                  text: 'Você concluiu\n',
                  style: AppTextStyles.body20,
                  children: [
                    TextSpan(
                      text: '$title\n',
                      style: AppTextStyles.bodyBold.copyWith(fontSize: 20.0)
                    ),
                    TextSpan(
                      text: 'com $rightAnswersCount de $questionsCount acertos.',
                      style: AppTextStyles.body20
                    )
                  ]
                ),
                textAlign: TextAlign.center,
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomActionButtonWidget.purple(
                  label: 'Compartilhar',
                  onTap: _shareResult
                ),
                SizedBox(height: 16.0),
                BottomActionButtonWidget.white(
                  label: 'Voltar ao início',
                  onTap: () {
                    Navigator.of(context).pop();
                  }
                )
              ]
            ),
          )
        ]
      )
    );
  }
}