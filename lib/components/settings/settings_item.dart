import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String details;
  final IconData icon;
  final VoidCallback fn;
  const SettingsItem(
      {super.key,
      required this.title,
      required this.fn,
      required this.details,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    return InkWell(
      onTap: () {
        fn();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyles.subheading,
                ),
                Text(
                  details,
                  style: textStyles.bodyNavbarActive,
                )
              ],
            ),
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
