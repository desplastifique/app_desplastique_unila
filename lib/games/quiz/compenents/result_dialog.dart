import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/games/quiz/models/questions.dart';

class ResultDialog {
  static Future show(
      BuildContext context, {
        @required Question question,
        @required bool correct,
        @required Function onNext,
      }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFDE3D8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: correct ? Colors.blueAccent : Colors.yellowAccent,
            child: Icon(
              correct ? Icons.check : Icons.close,
              color: Colors.purple,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question.question,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff340763),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                correct ? 'Você acertou!' : 'Você errou! O correto é:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: correct ? Colors.blue : Color(0xffff329d),
                ),
              ),
              Text(
                question.answer1,
                style: TextStyle(
                  color: Color(0xff04558a),
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('PRÓXIMO', style: TextStyle(color: Color(0xFF844079)),),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              },
            )
          ],
        );
      },
    );
  }
}