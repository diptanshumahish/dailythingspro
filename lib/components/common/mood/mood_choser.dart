import 'package:dailythingspro/components/common/mood/mood_glyph.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoodChooser extends StatelessWidget {
  final Function(String mood) moodResponse;
  final String selectedOne;
  const MoodChooser(
      {super.key, required this.moodResponse, required this.selectedOne});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How are you feeling?",
            style: TextStyles.subheading,
          ),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 5,
            children: [
              MoodGlyph(
                image: DailyThingsImages.happy,
                name: "happy",
                res: (mood) {
                  moodResponse(mood);
                },
                isActive: selectedOne == "happy",
              ),
              MoodGlyph(
                  image: DailyThingsImages.love,
                  name: "love",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "love"),
              MoodGlyph(
                  image: DailyThingsImages.blank,
                  name: "blank",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "blank"),
              MoodGlyph(
                  image: DailyThingsImages.angry,
                  name: "angry",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "angry"),
              MoodGlyph(
                  image: DailyThingsImages.dead,
                  name: "dead",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "dead")
            ],
          )
        ],
      ),
    );
  }
}
