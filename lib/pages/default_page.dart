import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:trabalho_final_dadm/components/fab/fancy_fab.dart';

class DefaultPage extends StatelessWidget {
  final Widget view;
  DefaultPage(this.view);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            // Image.asset(
            //   'assets/icons/logo.png',
            //   height: 30,
            // ),
            SizedBox(
              width: 10,
            ),
            // const Text('Desplastifique-se', style: TextStyle(fontSize: 14),),
            const Text('Desplastifique-se'),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Compartilhar',
            onPressed: () {
              Share.share(
                  'Desplastifique-se é um aplicativo para '
                      'conscientizar as pessoas sobre o uso de plástico. '
                      'Saiba mais: https://desplastifique.wordpress.com/',
                  subject: 'Disponível na Google Play.');
            },
          ),
        ],
      ),
      body: view,
      floatingActionButton: FancyFab(),
    );
  }
}