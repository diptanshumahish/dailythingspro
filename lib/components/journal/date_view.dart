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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Opacity(
        opacity: (pastDate && !isSelectedDate) ? 0.5 : 1,
        child: Container(
          decoration: BoxDecoration(
              color: currentDay
                  ? DailyThingsColors.themeBeige
                  : DailyThingsColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelectedDate
                      ? DailyThingsColors.themeOrange
                      : DailyThingsColors.tertiaryGray.withOpacity(0.6))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              children: [
                Text(
                  date.toString(),
                  style: currentDay
                      ? TextStyles.headingInvert
                      : TextStyles.heading,
                ),
                Text(
                  day,
                  style: currentDay
                      ? TextStyles.subheadingDark
                      : TextStyles.subheading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
