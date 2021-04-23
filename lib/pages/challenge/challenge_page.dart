import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/pages/challenge/challenge_controller.dart';
import 'package:dev_quiz/pages/challenge/widgets/bottom_action_button/bottom_action_button_widget.dart';
import 'package:dev_quiz/shared/models/quiz/answer_model.dart';
import 'package:dev_quiz/shared/models/quiz/question_model.dart';
import 'package:flutter/material.dart';
import 'widgets/challenge_appbar/challenge_appbar_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _challengeController = ChallengeController();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _challengeController.currentQuestion = _pageController.page?.toInt() ?? 0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  nextPage() {
    if (_challengeController.currentQuestion < widget.questions.length) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200), 
        curve: Curves.decelerate
      );
    }
  }

  Color feedbackColor(bool isRight) => 
      isRight ? AppColors.darkGreen : AppColors.darkRed;
  
  String feedbackText(bool isRight) =>
      isRight 
        ? 'Você acertou, parabéns!' 
        : 'Você errou! Melhor sorte na próxima!';

  IconData feedbackIcon(bool isRight) =>
      isRight ? Icons.check : Icons.close;
    
  _showFeedbackSnackbar(context, AnswerModel answer) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              feedbackIcon(answer.isRight),
              color: Colors.white
            ),
            SizedBox(width: 8.0),
            Text(
              feedbackText(answer.isRight), 
              style: AppTextStyles.body.copyWith(color: Colors.white)
            )
          ]
        ),
        backgroundColor: feedbackColor(answer.isRight),
        duration: Duration(seconds: 1),
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: ValueListenableBuilder(
          valueListenable: _challengeController.currentQuestionNotifier,
          builder: (_, value, __) {
            return ChallengeAppBarWidget(
              currentQuestion: _challengeController.currentQuestion, 
              questionsCount: widget.questions.length
            );
          }
        )
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions.map<Widget>(
          (question) => 
            QuizWidget(
              question: question, 
              onAnswerSelect: (answer) {
                _showFeedbackSnackbar(context, answer);
                Future.delayed(Duration(seconds: 1))
                  .then((_) => nextPage());
              },
            )
        ).toList()
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ValueListenableBuilder(
            valueListenable: _challengeController.currentQuestionNotifier,
            builder: (_, __, ___) {
              return Visibility(
                visible: _challengeController.currentQuestion < widget.questions.length,
                child: BottomActionButtonWidget.white(
                  label: 'Pular', 
                  onTap: nextPage
                ),
                replacement: BottomActionButtonWidget.green(
                  label: 'Confirmar', 
                  onTap: (){
                    Navigator.of(context).pop();
                  }
                ),
              );
            }
          )
        )
      )
    );
  }
}