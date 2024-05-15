import 'package:dailythingspro/components/common/mood/mood_glyph.dart';
import 'package:dailythingspro/constants/images.dart';

MoodGlyph returnGlyphDataMood(String mood) {
  if (mood == "happy") {
    return MoodGlyph(
        image: DailyThingsImages.happy,
        name: "happy",
        res: (_) {},
        isActive: false);
  } else if (mood == "love") {
    return MoodGlyph(
        image: DailyThingsImages.love,
        name: "love",
        res: (_) {},
        isActive: false);
  } else if (mood == "blank") {
    return MoodGlyph(
        image: DailyThingsImages.blank,
        name: "blank",
        res: (_) {},
        isActive: false);
  } else if (mood == "dead") {
    return MoodGlyph(
        image: DailyThingsImages.dead,
        name: "dead",
        res: (_) {},
        isActive: false);
  } else if (mood == "angry") {
    return MoodGlyph(
        image: DailyThingsImages.angry,
        name: "angry",
        res: (_) {},
        isActive: false);
  }
  return MoodGlyph(
      image: DailyThingsImages.blank,
      name: "blank",
      res: (_) {},
      isActive: false);
}
