import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle get splashHeading => TextStyle(
        fontSize: 32,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      );

  TextStyle get heading => TextStyle(
        fontSize: 26,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      );

  TextStyle get headingPlaceholder => TextStyle(
        fontSize: 26,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
      );

  TextStyle get headingInvert => TextStyle(
        fontSize: 26,
        color: Theme.of(context).colorScheme.background,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subheading => TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle get subheadingDark => TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.background,
        fontWeight: FontWeight.w600,
      );

  TextStyle get body => TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle get bodyInvert => TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.background,
      );

  TextStyle get bodyNavbarActive => TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.primary,
      );

  TextStyle get caption => TextStyle(
        fontSize: 12,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle get button => const TextStyle(
        fontSize: 14,
        color: DailyThingsColors.themeOrange,
        fontWeight: FontWeight.bold,
      );

  TextStyle get italic => TextStyle(
        fontStyle: FontStyle.italic,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle get italicInvert => const TextStyle(
        fontStyle: FontStyle.italic,
        color: DailyThingsColors.backgroundColor,
      );
}
