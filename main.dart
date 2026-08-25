import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz_Page/quizpage.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // بيشيل الشريط اللي على اليمين فوق
      home: QuizPage(),
    );
  }
}
