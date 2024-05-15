import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/utils/calendar/glyph/return_glyph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JContainer extends StatelessWidget {
  final String dayKey;
  final String title;
  final String description;
  final String time;
  final String mood;
  const JContainer({
    super.key,
    required this.dayKey,
    required this.title,
    required this.description,
    required this.mood,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: DailyThingsColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: DailyThingsColors.themeBeige.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.hourglass_bottom_rounded,
                  color: DailyThingsColors.tertiaryGray,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  DateFormat('hh : mm a').format(DateTime.parse(time)),
                  style: TextStyles.body,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.book_rounded,
                  color: DailyThingsColors.themeBeige,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.heading,
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: TextStyles.body,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(
              color: DailyThingsColors.themeOrange.withOpacity(0.3),
              indent: 0,
              endIndent: 0,
            ),
            returnGlyphDataMood(mood)
          ],
        ),
      ),
    );
  }
}
