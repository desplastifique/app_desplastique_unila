import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

final double defaultFontSize = 16;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primarySwatch: createMaterialColor(Color(0xffff329d)),
    accentColor: AppColors.textPrimary,
    backgroundColor: AppColors.background,
    fontFamily: "Roboto",
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      subtitle2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      subtitle1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyText2: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
    ),
  );
}