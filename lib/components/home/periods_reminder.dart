import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodsReminder extends ConsumerWidget {
  const PeriodsReminder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hushh, do you remember this?",
              style: textStyles.heading,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: DailyThingsColors.backgroundColor,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "It's almost your girlfriends' periods 🎀",
                    style: textStyles.subheading,
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  Text(
                    "As per last month, she had her periods on 12th, its very close to that date, make sure to sometimes send her some flowers and chocolates 🤗",
                    style: textStyles.body,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
