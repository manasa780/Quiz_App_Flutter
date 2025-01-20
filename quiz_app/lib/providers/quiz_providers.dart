import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/quiz_services.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;

  Future<void> loadQuestions() async {
    QuizService quizService = QuizService();
    final data = await quizService.fetchQuizData();
    _questions = data.map<Question>((json) => Question.fromJson(json)).toList();
    notifyListeners();
  }

  void answerQuestion(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex].answer) {
      _score++;
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      // Quiz completed
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}