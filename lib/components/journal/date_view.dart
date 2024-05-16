import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DateView extends StatelessWidget {
  final int date;
  final String day;
  final bool pastDate;
  final bool currentDay;
  final bool isSelectedDate;
  const DateView(
      {super.key,
      required this.date,
      required this.day,
      required this.pastDate,
      required this.isSelectedDate,
      required this.currentDay});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Opacity(
        opacity: (pastDate && !isSelectedDate) ? 0.5 : 1,
        child: Container(
          decoration: BoxDecoration(
              color: currentDay
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelectedDate
                      ? Theme.of(context).colorScheme.primary
                      : DailyThingsColors.tertiaryGray.withOpacity(0.6))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              children: [
                Text(
                  date.toString(),
                  style: currentDay
                      ? textStyles.headingInvert
                      : textStyles.heading,
                ),
                Text(
                  day,
                  style: currentDay
                      ? textStyles.subheadingDark
                      : textStyles.subheading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
