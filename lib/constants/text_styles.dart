import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const splashHeading = TextStyle(
    fontSize: 32,
    color: DailyThingsColors.themeOrange,
    fontWeight: FontWeight.bold,
  );
  static const heading = TextStyle(
    fontSize: 26,
    color: DailyThingsColors.themeBeige,
    fontWeight: FontWeight.bold,
  );
  static const headingPlaceholder = TextStyle(
    fontSize: 26,
    color: Colors.white54,
    fontWeight: FontWeight.bold,
  );
  static const headingInvert = TextStyle(
    fontSize: 26,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const subheading = TextStyle(
    fontSize: 16,
    color: DailyThingsColors.themeBeige,
  );
  static const subheadingDark =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);

  static const body = TextStyle(
    fontSize: 14,
    color: DailyThingsColors.tertiaryGray,
  );
  static const bodyInvert = TextStyle(
    fontSize: 14,
    color: DailyThingsColors.backgroundColor,
  );
  static const bodyNavbarActive = TextStyle(
    fontSize: 14,
    color: DailyThingsColors.themeOrange,
  );

  static const caption = TextStyle(
    fontSize: 12,
    color: DailyThingsColors.tertiaryGray,
  );

  static const button = TextStyle(
    fontSize: 14,
    color: DailyThingsColors.themeOrange,
    fontWeight: FontWeight.bold,
  );

  static const italic = TextStyle(
      fontStyle: FontStyle.italic, color: DailyThingsColors.tertiaryGray);
  static const italicInvert = TextStyle(
      fontStyle: FontStyle.italic, color: DailyThingsColors.backgroundColor);
}
