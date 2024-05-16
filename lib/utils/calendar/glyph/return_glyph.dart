import 'package:dailythingspro/components/common/mood/mood_glyph.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

MoodGlyph returnGlyphDataMood(String mood) {
  if (mood == "happy") {
    return MoodGlyph(
        icon: PhosphorIconsRegular.smiley,
        name: "happy",
        res: (_) {},
        isActive: false);
  } else if (mood == "love") {
    return MoodGlyph(
        icon: PhosphorIconsRegular.smileyMelting,
        name: "love",
        res: (_) {},
        isActive: false);
  } else if (mood == "blank") {
    return MoodGlyph(
        icon: PhosphorIconsRegular.smileyMeh,
        name: "blank",
        res: (_) {},
        isActive: false);
  } else if (mood == "dead") {
    return MoodGlyph(
        icon: PhosphorIconsRegular.smileyXEyes,
        name: "dead",
        res: (_) {},
        isActive: false);
  } else if (mood == "angry") {
    return MoodGlyph(
        icon: PhosphorIconsRegular.smileyAngry,
        name: "angry",
        res: (_) {},
        isActive: false);
  }
  return MoodGlyph(
      icon: PhosphorIconsRegular.smileyMeh,
      name: "blank",
      res: (_) {},
      isActive: false);
}
