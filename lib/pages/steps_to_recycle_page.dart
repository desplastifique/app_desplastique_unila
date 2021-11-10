import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/components/fab/fancy_fab.dart';
import 'package:trabalho_final_dadm/pages/default_page.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

Widget _buildCard(
    {String title, String subtitle, String body, String imagePath}) {
  return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        elevation: 20,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_forward_rounded),
              title: Text(title),
              subtitle: Text(
                subtitle,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Image.asset(imagePath),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  body,
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ));
}

Widget buildStepsToRecyclePage() {
  return Material(
    child: ListView(
      children: [
        buildTopPageTitle(
          title: "Passos para reciclar",
          backgroundColor: Colors.teal,
        ),
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
          child: capi(
              text:
                  "É muito simples preparar o seu lixo para reciclagem. Veja só:"),
        ),
        SizedBox(
          height: 10,
        ),
        _buildCard(
            title: "Passo 1",
            subtitle: "Separe os materiais",
            body: "A primeira coisa a se fazer para preparar os objetos é "
                "separá-los do lixo orgânico para que nenhum deles seja "
                "colocado em lugar indevido e tenha o destino errado. "
                "\n\nLembre-se de que restos de comidas são lixo orgânico e, "
                "por isso, não devem ser colocados junto com os "
                "recicláveis. ",
            imagePath: 'assets/plastics.jpg'),
        _buildCard(
            title: "Passo 2",
            subtitle: "Limpe as embalagens",
            body: "Ao separar os materiais, as pessoas podem ajudar as "
                "cooperativas de reciclagem limpando as embalagens. "
                "Isso deve ser feito com todas aquelas que estiverem sujas,"
                " obviamente; porém, é necessário atenção com o gasto "
                "exagerado de água durante esse processo. \n\nPortanto, "
                "se for possível, faça a limpeza utilizando um pano ou, "
                "caso não seja suficiente, opte pela água de reuso "
                "(da louça ou da máquina de lavar, por exemplo) para "
                "limpar os materiais que vão para a reciclagem. ",
            imagePath: 'assets/wash.jpg'),
        _buildCard(
            title: "Passo 3",
            subtitle: "Use latas de lixo diferentes",
            body: "Tenha em sua casa latas de lixo distintas para os "
                "diferentes materiais, para não se confundir com o descarte "
                "e nem com o destino dos produtos. \n\nCaso haja a necessidade e "
                "a possibilidade, tenha também latas de lixo em cores "
                "diferentes para facilitar a separação dos materiais "
                "recicláveis. Se não estiver familiarizado com as cores, "
                "listamos abaixo para lembrá-lo: "
                "\n\nVermelho - Plástico "
                "\nAmarelo - Metal"
                "\nVerde - Vidro"
                "\nAzul - Papel"
                "\nMarrom - Orgânico",
            imagePath: 'assets/trash.png'),
      ],
    ),
  );
}

class StepsToRecyclePage extends DefaultPage {
  StepsToRecyclePage() : super(buildStepsToRecyclePage());
}
