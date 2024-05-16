import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SomethingElse extends ConsumerWidget {
  const SomethingElse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: DailyThingsColors.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: DailyThingsColors.tertiaryGray.withOpacity(0.3),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Looking for something else?",
                  style: TextStyles.heading,
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(tabsProvider.notifier).updateTab(3);
                  },
                  child: Text(
                    "settings page",
                    style: TextStyle(
                        color: DailyThingsColors.themeBeige,
                        decoration: TextDecoration.underline,
                        decorationColor: DailyThingsColors.themeBeige),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
