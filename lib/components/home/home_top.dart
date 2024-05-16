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
    TextStyles textStyles = TextStyles(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today is, ",
              style: textStyles.body,
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 100), curve: Curves.easeInOut)
              ],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('d MMM, yyyy (EEEE)').format(DateTime.now()),
                    style: textStyles.heading,
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              "Heyo ^^",
              style: textStyles.subheading,
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 200), curve: Curves.easeInOut)
              ],
              child: Text(
                "${userDetails.name ?? "buddy"},",
                style: textStyles.splashHeading,
              ),
            ),
            Animate(
              effects: const [
                FadeEffect(
                    delay: Duration(milliseconds: 300), curve: Curves.easeInOut)
              ],
              child: Text(
                greetUser(TimeOfDay.now(), userDetails.gender ?? "M"),
                style: textStyles.subheading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
