import 'package:flutter/material.dart';

Widget capi({String text, int width = 100, int height = 100}) {
  return Row(
    children: [
      Image(
        image: AssetImage('assets/capi-transparent.png'),
        width: 100,
        height: 100,
      ),
      Flexible(
        child: Text(text),
      ),
    ],
  );
}
