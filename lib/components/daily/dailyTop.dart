import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyTop extends ConsumerWidget {
  const DailyTop({super.key});

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
              "Organize your life",
              style: textStyles.splashHeading,
            ),
            Text(
              "organized life = better outcomes",
              style: textStyles.italic,
            )
          ],
        ),
      ),
    );
  }
}
