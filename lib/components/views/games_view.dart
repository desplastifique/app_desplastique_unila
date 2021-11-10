import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/games/memory/memory.dart';
import 'package:trabalho_final_dadm/games/quiz/quiz.dart';
import 'package:trabalho_final_dadm/pages/default_page.dart';

class GamesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          buildTopPageTitle(title: "Jogos"),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: capi(text: "Uhul! Hora de se divertir um pouco!")),
          Expanded(
            child: GridView.count(crossAxisCount: 2, children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DefaultPage(MemoryGame());
                      }),
                    );
                  },
                  child: Text(
                    "Jogo da memória",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        // return DefaultPage(QuizGame());
                        return DefaultPage(QuizPage());
                      }),
                    );
                  },
                  child: Text(
                    "Quiz",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Jogo dos 7 erros",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 24),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Jogo da velha",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 24),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Adivinhe o tipo de plástico",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 24),
              // ),
              //),
              // ),
            ]),
          ),
        ],
      ),
    );
    // GridView.count(
  }
}

