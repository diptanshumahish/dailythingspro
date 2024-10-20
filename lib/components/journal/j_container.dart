import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/utils/calendar/glyph/return_glyph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    TextStyles textStyles = TextStyles(context);

    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIconsRegular.hourglass,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  DateFormat('hh : mm a').format(DateTime.parse(time)),
                  style: textStyles.body,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.book_rounded,
                  color: Theme.of(context).colorScheme.tertiary,
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
                    style: textStyles.heading,
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: textStyles.body,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 5,),
            returnGlyphDataMood(mood)
          ],
        ),
      ),
    );
  }
}
