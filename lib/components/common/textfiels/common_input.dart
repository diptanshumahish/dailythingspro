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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: DailyThingsColors.themeBeige.withOpacity(0.3))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: DailyThingsColors.themeBeige.withOpacity(0.9))),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white54),
        fillColor:
            DailyThingsColors.backgroundColor, // Slight gray background color
        filled: true, // Apply background color
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
