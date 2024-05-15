import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/onbaord/onbaord_age.dart';
import 'package:flutter/material.dart';

class MoodGlyph extends StatelessWidget {
  final String image;
  final String name;
  final Function(String mood) res;
  final bool isActive;
  const MoodGlyph(
      {super.key,
      required this.image,
      required this.name,
      required this.res,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        res(name);
      },
      child: Container(
        decoration: BoxDecoration(
            color: isActive
                ? DailyThingsColors.themeBeige.withOpacity(0.3)
                : DailyThingsColors.themeBeige.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: DailyThingsColors.themeBeige.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                name,
                style: TextStyles.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
