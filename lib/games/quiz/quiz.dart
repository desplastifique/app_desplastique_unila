import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/games/quiz/compenents/centered_message.dart';
import 'package:trabalho_final_dadm/games/quiz/compenents/circularprogress.dart';
import 'package:trabalho_final_dadm/games/quiz/compenents/finish_dialog.dart';
import 'package:trabalho_final_dadm/games/quiz/compenents/result_dialog.dart';
import 'package:trabalho_final_dadm/games/quiz/controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];
  List<Widget> _scoreKeeper2 = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: _buildQuiz(),
        ),
      ),
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildTopPageTitle(
            title:
            "Quiz ( ${_scoreKeeper.length}/${_controller.questionsNumber} )",
            backgroundColor: Colors.lightGreen),
        // Text('Quiz ( ${_scoreKeeper.length}/${_controller.questionsNumber} )', style: TextStyle(color: Colors.white),),
        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildScoreKeeper(),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswerButton(String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.lightBlue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  if (_scoreKeeper.length > _controller.questionsNumber / 2) {
                    _scoreKeeper2.add(Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.deepOrange,
                    ));
                  } else {
                    _scoreKeeper.add(Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.deepOrange,
                    ));
                  }

                  if (_scoreKeeper.length+_scoreKeeper2.length < _controller.questionsNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(context,
                        hitNumber: _controller.hitNumber,
                        questionNumber: _controller.questionsNumber);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  _buildScoreKeeper() {
    return Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _scoreKeeper,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _scoreKeeper2,
            ),
          ],
        )
    );
  }
}
