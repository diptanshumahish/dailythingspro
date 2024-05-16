import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class DailyThingsTheme {
  static final theme = ThemeData(
      primaryColor: DailyThingsColors.themeOrange,
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      colorScheme: const ColorScheme.dark(
          background: DailyThingsColors.backgroundColor,
          primary: DailyThingsColors.themeOrange,
          tertiary: Color(0xFFB5B5B5),
          secondary: DailyThingsColors.tertiaryGray),
      useMaterial3: true,
      fontFamily: "Cabinet");

  //light one
  static final lightTheme = ThemeData(
      primaryColor: DailyThingsColors.backgroundColor,
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
      colorScheme: const ColorScheme.light(
          background: Colors.white,
          primary: DailyThingsColors.backgroundColor,
          tertiary: Color.fromRGBO(44, 45, 46, 1),
          secondary: Color(0xFF222222)),
      useMaterial3: true,
      fontFamily: "Cabinet");
}
