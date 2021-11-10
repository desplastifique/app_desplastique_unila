import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/pages/check_plastic_page.dart';
import 'package:trabalho_final_dadm/pages/collaborate_page.dart';
import 'package:trabalho_final_dadm/pages/collect_page.dart';
import 'package:trabalho_final_dadm/pages/games_page.dart';
import 'package:trabalho_final_dadm/pages/send_photo.dart';
import 'package:trabalho_final_dadm/pages/steps_to_recycle_page.dart';
import 'package:trabalho_final_dadm/services/curiosity_of_the_day.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';
import 'package:trabalho_final_dadm/themes/app_theme.dart';

class HomeView extends StatelessWidget {
  final bool firstTime;

  HomeView({this.firstTime});

  List<Widget> _buildGreetings() {
    return [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          firstTime ? "Bem-vindo," : "Bem-vindo de volta!",
          style: TextStyle(
            fontSize: 52,
          ),
        ),
      ),
      SizedBox(height: 20,),
      firstTime ? Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Este é o Desplastifique-se, um aplicativo para "
              "ajudar você a repensar sobre o consumo de plásticos.",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: defaultFontSize,
          ),
        ),
      ) : Container(),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: firstTime
              ? capi(
              text:
              "Olá, eu sou a Capi, e estou aqui para ajudar você a"
                  " repensar sobre o seu lixo plástico! Vamos lá?")
              : capi(
              text:
              "Oi de novo! Estou muito feliz em te ver por aqui.")),
      buildSubtitleAccentColor(
          data: firstTime
              ? "Veja algumas das coisas que você pode fazer:"
              : "O que quer fazer hoje?")
    ];
  }
  Widget _buildBigButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBigButton(
              icon: Icons.sentiment_very_satisfied,
              text: 'Como reciclar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StepsToRecyclePage();
                  }),
                );
              },
            ),
            buildBigButton(
              icon: Icons.search,
              color: AppColors.checkPlasticColor,
              text: 'Verificar um plástico',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CheckPlasticPage();
                  }),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBigButton(
              icon: Icons.location_on_outlined,
              color: AppColors.findCollectionPlacesColor,
              text: 'Encontrar postos de coleta',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CollectPage();
                  }),
                );
              },
            ),
            buildBigButton(
              icon: Icons.videogame_asset,
              color: AppColors.colaborateColor,
              text: 'Vamos Jogar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return GamesPage();
                  }),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCuriositySection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.secondary),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Curiosidade do dia...",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildCuriosityOfTheDay(data: getCuriosityOfTheDay())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ..._buildGreetings(),
                _buildBigButtons(context)
              ],
            ),
          ),
          _buildCuriositySection(),
          buildSection(
            title: "O que são plásticos?",
            bodyText: "De forma sucinta, plásticos são materiais formados por"
                " grandes cadeias moleculares chamadas de "
                "“polímeros”. Eles são produzidos a partir da "
                "polimerização, ou seja, da união de moléculas "
                "químicas ainda menores, chamadas de “monômeros” e "
                "moldados de diversas formas. \n\nOs plásticos estão "
                "presentes em muitos lugares como nas sacolas de "
                "mercado, nos canos de tubulações, em diversos tipos"
                " de embalagens como de comida e produtos de limpeza,"
                " brinquedos entre outros.",
            backgroundColor: AppColors.primary,
            color: Colors.white,
            image: AssetImage('assets/outline.png'),
            callToAction: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StepsToRecyclePage();
                  }),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.accent),
              ),
              icon: Icon(Icons.assignment_turned_in_sharp),
              label: Text("Passo-a-passo para reciclar"),
            ),
          ),
          buildSection(
            title: "Tipos de plásticos",
            bodyText: "Pois é! Existem muitos tipos de plásticos. "
                "O tamanho e a estrutura das moléculas do "
                "polímero são quem determinam seu tipo. Confira-os.",
            backgroundColor: AppColors.secondary,
            color: AppColors.primary,
            image: AssetImage('assets/tipos.png'),
            callToAction: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CheckPlasticPage();
                  }),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.accent),
              ),
              icon: Icon(Icons.search),
              label: Text("Verificar o tipo de plástico"),
            ),
          ),
          buildVisitUs(),
        ],
      ),
    );
  }
}
