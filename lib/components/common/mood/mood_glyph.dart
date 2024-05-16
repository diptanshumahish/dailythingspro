import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MoodGlyph extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function(String mood) res;
  final bool isActive;
  const MoodGlyph(
      {super.key,
      required this.icon,
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
                ? DailyThingsColors.themeBeige
                : DailyThingsColors.themeBeige.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isActive
                    ? DailyThingsColors.backgroundColor.withOpacity(0.2)
                    : DailyThingsColors.themeBeige.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhosphorIcon(
                icon,
                color: isActive
                    ? DailyThingsColors.backgroundColor
                    : DailyThingsColors.tertiaryGray,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                name,
                style: isActive ? TextStyles.bodyInvert : TextStyles.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
