import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/components/common.dart';


class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          buildTopPageTitle(title: "Sobre nós",
              backgroundColor: Colors.lightGreen),
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
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/capi-transparent.png'),
                  width: 100,
                  height: 100,
                ),
                Flexible(
                  child: Text(
                    "Quer conhecer sobre a gente?",
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Esse é o aplicativo de conscientização, para o uso"
                " racional de plástico - Um do projeto de extensão "
                "\ Desplastifique-se\" - UNILA.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Sobre o aplicativo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Desenvolvido por:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("Lucas Rafael Stefanel Gris\n e \n Maria G. A. Barros",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Conteúdo:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("Maria G. A. Barros\n Luis Guilherme S. Jesus \n Gabrielli R. Lopes\n",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Coordenação:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("Profª Drª Caroline Gonçalves\n",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Aplicativo iniciado na disciplina de Desenvolvimento"
                " de Aplicativos Móveis, sob orientação do professor "
                "Everton Coimbra de Araujo - UTFPR Medianeira para o Projeto "
                "de extensão Desplastifique-se UNILA",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Sobre o projeto",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("O projeto de extensão “Desplastifique-se” vêm "
                "sendo realizado por discentes, docentes e servidores da "
                "Universidade Federal da Integração Latino-Americana (UNILA), com "
                "foco em jovens de idade escolar no município de Foz do Iguaçu, para"
                "promover a reflexão sobre o consumo de material plástico.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,),
          ),
          buildVisitUs(),
        ],
      ),
    );
  }
}