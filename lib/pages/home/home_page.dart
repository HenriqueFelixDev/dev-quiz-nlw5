import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/pages/challenge/challenge_page.dart';
import 'package:dev_quiz/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/level_button/level_button_widget.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';
import 'widgets/custom_app_bar/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.loadData();
    _homeController.stateNotifier.addListener(() {
      setState((){});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (_homeController.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen)
          )
        )
      );
    }

    if (_homeController.state == HomeState.error) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100.0,
                height: 100.0,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.darkRed,
                  borderRadius: BorderRadius.circular(100.0)
                ),
                child: Icon(Icons.close_rounded, size: 72.0, color: AppColors.white)
              )
            ),
            SizedBox(height: 16.0),
            Text('Ocorreu um erro ao carregar os dados!', textAlign: TextAlign.center)
          ]
        )
      );
    }

    return Scaffold(
      appBar: CustomAppBarWidget(user: _homeController.user!),
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
            if(_homeController.quizzes?.isEmpty ?? true)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.noData, width: 150.0),
                    SizedBox(height: 16.0),
                    Text(
                      'Nenhum resultado encontrado!', 
                      textAlign: TextAlign.center, 
                      style: AppTextStyles.body
                    )
                  ]
                ),
              )
            else
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: _homeController.quizzes?.map<Widget>((quiz) =>
                    QuizCardWidget(
                      title: quiz.title,
                      icon: AppImages.data,
                      questionsCount: quiz.questions.length,
                      completedQuestionsCount: quiz.questionsAnswered,
                      onTap: () => 
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChallengePage(quiz: quiz)
                          )
                        )
                    )
                  ).toList()
                  ?? []
                )
              )
          ]
        ),
      )
    );
  }
}