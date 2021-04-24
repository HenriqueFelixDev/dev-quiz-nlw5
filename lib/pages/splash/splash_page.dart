import 'package:dev_quiz/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
      .then((_) => Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (_) => HomePage())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Center(
          child: Image.asset(AppImages.logo)
        )
      )
    );
  }
}