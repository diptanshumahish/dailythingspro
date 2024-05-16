import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DailyProgress extends StatelessWidget {
  final double progress;
  const DailyProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    final double progressFraction = progress.clamp(0, 100) / 100.0;

    return SliverToBoxAdapter(
      child: Animate(
        effects: const [
          FadeEffect(
              delay: Duration(milliseconds: 100), curve: Curves.easeInOut)
        ],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your day progress",
                    style: textStyles.heading,
                  ),
                  const SizedBox(height: 10.0), // Add some spacing

                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                    child: LinearProgressIndicator(
                      value: progressFraction,
                      minHeight: 5.0, // Adjust minimum height
                      backgroundColor: Theme.of(context)
                          .primaryColor
                          .withOpacity(0.2), // Background color
                      color: progressFraction < 0.5
                          ? Colors.orange
                          : const Color(0xFF8ED891),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    progress.isNaN
                        ? "No tasks for the day yet"
                        : "You are ${progress.toStringAsFixed(2)} % done",
                    style: textStyles.bodyNavbarActive,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
