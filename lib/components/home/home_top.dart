import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/greeting_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeTop extends ConsumerWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userProvider);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today is, ",
              style: TextStyles.body,
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 100), curve: Curves.easeInOut)
              ],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: DailyThingsColors.themeOrange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('d MMM, yyyy (EEEE)').format(DateTime.now()),
                    style: TextStyles.heading,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white24,
            ),
            const Text(
              "Heyo ^^",
              style: TextStyles.subheading,
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 200), curve: Curves.easeInOut)
              ],
              child: Text(
                "${userDetails.name ?? "buddy"},",
                style: TextStyles.splashHeading,
              ),
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 300), curve: Curves.easeInOut)
              ],
              child: Text(
                greetUser(TimeOfDay.now(), userDetails.gender ?? "M"),
                style: TextStyles.subheading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
