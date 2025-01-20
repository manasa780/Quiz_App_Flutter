// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_providers.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: FutureBuilder(
        future: quizProvider.loadQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (quizProvider.questions.isEmpty) {
            return Center(child: Text('No questions available.'));
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quizProvider.questions[quizProvider.currentQuestionIndex].question,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...quizProvider.questions[quizProvider.currentQuestionIndex].options.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    quizProvider.answerQuestion(option);
                    if (quizProvider.currentQuestionIndex == quizProvider.questions.length - 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ResultScreen()),
                      );
                    }
                  },
                  child: Text(option),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}