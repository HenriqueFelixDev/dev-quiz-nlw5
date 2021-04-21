import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'widgets/level_button/level_button_widget.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';
import 'widgets/custom_app_bar/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: 'Fácil'),
                LevelButtonWidget(label: 'Médio'),
                LevelButtonWidget(label: 'Difícil'),
                LevelButtonWidget(label: 'Perito')
              ]
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  QuizCardWidget(
                    title: 'Gerenciamento de Estado',
                    icon: AppImages.data,
                    questionsCount: 10,
                    completedQuestionsCount: 3
                  ),
                  QuizCardWidget(
                    title: 'Construindo Interfaces',
                    icon: AppImages.laptop,
                    questionsCount: 10,
                    completedQuestionsCount: 10
                  ),
                  QuizCardWidget(
                    title: 'Integração Nativa',
                    icon: AppImages.hierarchy,
                    questionsCount: 10,
                    completedQuestionsCount: 9
                  ),
                  QuizCardWidget(
                    title: 'Widgets do Flutter',
                    icon: AppImages.blocks,
                    questionsCount: 10,
                    completedQuestionsCount: 5
                  ),
                ]
              )
            )
          ]
        ),
      )
    );
  }
}