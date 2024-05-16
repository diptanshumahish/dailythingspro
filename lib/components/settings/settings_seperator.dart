import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsSeparator extends StatelessWidget {
  final String name;
  final IconData icon;
  const SettingsSeparator({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: textStyles.caption,
        ),
        Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          size: 12,
        )
      ],
    );
  }
}
