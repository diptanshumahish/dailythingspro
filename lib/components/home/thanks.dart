import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              DailyThingsImages.zen,
              height: 150,
            ),
            const Text(
              "Thanks for using dailyThings",
              style: TextStyles.heading,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We're still in early development,but exciting features are coming soon! In the meantime, we'd be thrilled if you tried the app and shared your thoughts. Let us know if you encounter any issues, have feedback on your experience, or ideas for improvement. Your input is invaluable in shaping the app's future!",
              style: TextStyles.body,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
