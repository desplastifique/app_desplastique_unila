import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final_dadm/games/quiz/models/questions.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbxC6pIiSv7MxcRS9hiyegzS-ivZW0EXBKbUg1p17L-n8RtmhJA/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}

