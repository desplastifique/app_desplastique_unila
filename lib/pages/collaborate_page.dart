import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:trabalho_final_dadm/components/fab/fancy_fab.dart';
import 'package:trabalho_final_dadm/pages/default_page.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';


// Widget buildCollaboratePage() {
//   return Material(
//     child: ListView(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Center(
//             child: Text(
//               "Colaborar",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           height: 64,
//           color: AppColors.colaborateColor,
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Image(
//                 image: AssetImage('assets/capi-transparent.png'),
//                 width: 100,
//                 height: 100,
//               ),
//               Flexible(
//                 child: Text(
//                   "Vamos gostar muito de sua ajuda!",
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
//
// class CollaboratePage extends DefaultPage {
//
//   CollaboratePage() : super(buildCollaboratePage());
//
// }
