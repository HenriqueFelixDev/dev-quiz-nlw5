import 'package:flutter/material.dart';
import 'widgets/challenge_appbar/challenge_appbar_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengeAppBar(currentQuestion: 6, questionsCount: 10),
      body: SingleChildScrollView(
        child: QuizWidget()
      ),
    );
  }
}