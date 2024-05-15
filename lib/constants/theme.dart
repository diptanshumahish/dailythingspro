import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class DailyThingsTheme {
  static final theme = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: DailyThingsColors.themeOrange,
      ),
      useMaterial3: true,
      fontFamily: "Cabinet");
}
