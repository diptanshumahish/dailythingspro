import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsTop extends StatelessWidget {
  const SettingsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyles.splashHeading,
            )
          ],
        ),
      ),
    );
  }
}
