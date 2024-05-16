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
    TextStyles textStyles = TextStyles(context);

    return GestureDetector(
      onTap: () {
        res(name);
      },
      child: Container(
        decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.5))),
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
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                name,
                style: isActive ? textStyles.bodyInvert : textStyles.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
