import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizService {
  final String apiUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<List<dynamic>> fetchQuizData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body)['questions'];
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      throw Exception('Failed to load quiz data: $e');
    }
  }
}