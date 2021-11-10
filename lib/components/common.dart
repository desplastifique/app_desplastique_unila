import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/constants.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';
import 'package:trabalho_final_dadm/themes/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildSubtitleAccentColor({String data, double fontSize}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      data,
      style: TextStyle(
        color: AppColors.accent,
        fontSize: fontSize,
      ),
    ),
  );
}

Widget buildBigButton(
    {Color color, String text, IconData icon, void Function() onPressed}) {
  return ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 120, height: 120),
    child: ElevatedButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: color,
      ),
    ),
  );
}

Widget buildCuriosityOfTheDay({String data, double fontSize}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      data,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.w400, color: AppColors.primary),
    ),
  );
}

Widget buildVisitUs() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Text("Visite-nos:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('assets/icons/wordpress.png'),
              iconSize: 40,
              onPressed: () {
                launch(wordpressUrl);
              },
            ),
            IconButton(
              icon: Image.asset('assets/icons/insta.png'),
              iconSize: 40,
              onPressed: () {
                launch(instaUrl);
              },
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildSection({
  String title,
  String bodyText,
  Color color,
  Color backgroundColor,
  AssetImage image,
  Widget callToAction,
}) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(color: backgroundColor),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: color),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Image(
            image: image,
            width: 300,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            bodyText,
            style: TextStyle(
                fontSize: defaultFontSize, fontWeight: FontWeight.w400, color: color),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        callToAction != null ? callToAction : Container()
      ],
    ),
  );
}

Widget buildTopPageTitle(
    {String title,
    Color backgroundColor = AppColors.barColor,
    Color color = Colors.white}) {
  return Container(
    padding: title.length > 15 ? EdgeInsets.symmetric(horizontal: 20) : EdgeInsets.all(0),
    child: Center(
      child: Text(
        title,
        overflow: TextOverflow.fade,
        style:
            TextStyle(color: color, fontSize: title.length > 10 ? 28 : 36, fontWeight: FontWeight.bold),
      ),
    ),
    height: title.length > 20 ? 100 : 64,
    color: backgroundColor,
  );
}
