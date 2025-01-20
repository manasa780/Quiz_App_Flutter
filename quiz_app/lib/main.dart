import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_providers.dart';
import 'screens/quiz_screens.dart';
//import 'screens/result_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: QuizScreen(),
      ),
    );
  }
}