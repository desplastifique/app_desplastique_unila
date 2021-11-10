import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/models/Plastic.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

class CheckPlasticView extends StatefulWidget {
  State createState() => new _CheckPlasticViewState();
}

class _CheckPlasticViewState extends State<CheckPlasticView> {
  int _value = 0;
  double _currentSliderValue = 20;
  File _image;
  Plastic plastic = Plastic();

  // final picker = ImagePicker();
  //
  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path); //Todo
  //       _value = -1;
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }
  //
  // Future<void> _showConfirmationTakePhoto() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Verificar por foto',
  //           style: TextStyle(
  //               fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
  //         ),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: <Widget>[
  //               Text(
  //                 'Você está prestes a escanear um tipo de plástico por foto.',
  //                 style: TextStyle(
  //                     fontSize: 18,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w300),
  //               ),
  //               Text(
  //                 'Por enquanto esse recurso é experimental (estamos melhorando rs).',
  //                 style: TextStyle(
  //                     fontSize: 18,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w300),
  //               ),
  //               Text(
  //                 'Mire na parte em que aparece o código do plástico.',
  //                 style: TextStyle(
  //                     fontSize: 18,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w300),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Image.asset(
  //                 'assets/example.jpg',
  //                 fit: BoxFit.cover,
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //               child: Text('Vamos lá'),
  //               onPressed: () {
  //                 getImage();
  //                 Navigator.of(context).pop();
  //               }),
  //           TextButton(
  //             child: Text('Cancelar'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _showExample() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Onde encontrar o código?',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'O código normalmente fica exposto em alguma face do plástico.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Procure algo como na imagem:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/example.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDropdownMenu() {
    return DropdownButton(
      style: TextStyle(fontSize: 18, color: AppColors.accent),
      value: _value,
      items: <DropdownMenuItem<int>>[
        new DropdownMenuItem(
          child: new Text(''),
          value: 0,
        ),
        new DropdownMenuItem(
          child: new Text('1 - PET'),
          value: 1,
        ),
        new DropdownMenuItem(
          child: new Text('2 - PEAD'),
          value: 2,
        ),
        new DropdownMenuItem(
          child: new Text('3 - PVC'),
          value: 3,
        ),
        new DropdownMenuItem(
          child: new Text('4 - PEBD'),
          value: 4,
        ),
        new DropdownMenuItem(
          child: new Text('5 - PP'),
          value: 5,
        ),
        new DropdownMenuItem(
          child: new Text('6 - PS'),
          value: 6,
        ),
        new DropdownMenuItem(
          child: new Text('7 - OUTROS'),
          value: 7,
        ),
      ],
      onChanged: (int value) {
        setState(() {
          _value = value;
          this.plastic = Plastic(PlasticType.values[_value]);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          buildTopPageTitle(
              title: "Verificar o tipo do plástico"),
          Padding(
            padding: EdgeInsets.all(10),
            child: capi(
                text: "Aqui você pode informar o tipo de plástico para saber "
                    "detalhes sobre sua composição. Legal né?"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropdownMenu(),
                // Text("ou"),
                // ElevatedButton(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Icon(Icons.camera_alt),
                //     ],
                //   ),
                //   // onPressed: _showConfirmationTakePhoto,
                //      style: ElevatedButton.styleFrom(
                //      shape: CircleBorder(),
                //     primary: AppColors.sendPictureColor,
                //   ),
                // ),
              ],
            ),
          ),
          TextButton(
              onPressed: _showExample, child: Text("Onde encontro o código?")),
          this.plastic.info != null
              ? Container(
            padding: EdgeInsets.all(20),
            child: Text(
              this.plastic.info,
              textAlign: TextAlign.justify,
            ),
          )
              : Container(),
          this.plastic.imagePath != null
              ? Container(
            padding: EdgeInsets.all(20),
            child: Image.asset(
              this.plastic.imagePath,
            ),
          )
              : Container(),
          Divider(),
          this.plastic.price != null
              ? Container(
            child: buildSubtitleAccentColor(
                data: "Quanto custa?", fontSize: 32),
            margin: EdgeInsets.all(20),
          ) : Container(),
          this.plastic.price != null
              ? Slider(
            value: _currentSliderValue,
            min: 1,
            max: 100,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          )
              : Container(),
          this.plastic.price != null
              ? Container(
            height: 200,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _currentSliderValue.truncate().toString() + "Kg",
                  style: TextStyle(fontSize: 42),
                ),
                Text(
                  "do plástico informado custa, aproximadamente,",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "R\$ " +
                      (_currentSliderValue * this.plastic.price)
                          .truncate()
                          .toString(),
                  style: TextStyle(fontSize: 42),
                ),
              ],
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}

