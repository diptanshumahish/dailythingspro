import 'package:dailythingspro/components/common/mood/mood_glyph.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MoodChooser extends StatelessWidget {
  final Function(String mood) moodResponse;
  final String selectedOne;
  const MoodChooser(
      {super.key, required this.moodResponse, required this.selectedOne});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How are you feeling?",
            style: textStyles.subheading,
          ),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: [
              MoodGlyph(
                icon: PhosphorIconsRegular.smiley,
                name: "happy",
                res: (mood) {
                  moodResponse(mood);
                },
                isActive: selectedOne == "happy",
              ),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileyMelting,
                  name: "love",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "love"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileyMeh,
                  name: "blank",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "blank"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileyAngry,
                  name: "angry",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "angry"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileyXEyes,
                  name: "dead",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "dead"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileySad,
                  name: "sad",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "sad"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.smileyNervous,
                  name: "nervous",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "nervous"),
              MoodGlyph(
                  icon: PhosphorIconsRegular.heartBreak,
                  name: "heart break",
                  res: (mood) {
                    moodResponse(mood);
                  },
                  isActive: selectedOne == "heartbreak")
            ],
          )
        ],
      ),
    );
  }
}
