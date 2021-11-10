import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/main.dart';
import 'package:trabalho_final_dadm/models/Plastic.dart';
import 'package:trabalho_final_dadm/services/common.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

// class SendPhotoView extends StatefulWidget {
//   State createState() => new _SendPhotoViewState();
// }
//
// class _SendPhotoViewState extends State<SendPhotoView> {
//   File _image;
//   Plastic plastic = Plastic();
//
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: ListView(
//         children: [
//           buildTopPageTitle(
//             title: "Enviar uma foto",
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: capi(text: "Aqui você pode mandar a foto de um plástico qualquer. "
//                 "Isso vai ajudar a gente a desenvolver soluções "
//                 "inteligentes para separar o lixo.")
//           ),
//           Container(
//             padding: EdgeInsets.all(30),
//             child: Column(
//               children: [
//                 Text("Envie uma foto como no exemplo abaixo:", textAlign: TextAlign.center,),
//                 Text("(Não esqueça de mostrar o código)", textAlign: TextAlign.center),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 75),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 'assets/example.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(30),
//             child: ElevatedButton(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.camera_alt,
//                     size: 30,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 getImage();
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: CircleBorder(),
//                 minimumSize: Size(50, 50),
//                 primary: AppColors.sendPictureColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
