import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  const CommonInput(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      controller: controller,
      maxLines: 4,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: DailyThingsColors.themeBeige.withOpacity(0.9))),
        labelText: labelText,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context)
            .colorScheme
            .surface, // Slight gray background color
        filled: true, // Apply background color
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
