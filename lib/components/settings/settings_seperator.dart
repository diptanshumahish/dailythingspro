import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsSeparator extends StatelessWidget {
  final String name;
  final IconData icon;
  const SettingsSeparator({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyles.caption,
        ),
        Icon(
          icon,
          color: DailyThingsColors.tertiaryGray,
          size: 12,
        )
      ],
    );
  }
}
