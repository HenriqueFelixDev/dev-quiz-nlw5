import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/challenge/challenge_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
