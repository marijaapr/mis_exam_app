import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamListScreen(),
    );
  }

}