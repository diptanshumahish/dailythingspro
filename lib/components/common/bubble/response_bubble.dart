import 'package:audioplayers/audioplayers.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResponseBubble extends StatelessWidget {
  final String chat;
  final bool isRightBubble;
  final VoidCallback fn;
  final int? del;

  const ResponseBubble(
      {super.key,
      required this.chat,
      required this.isRightBubble,
      required this.fn,
      this.del});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
            delay: Duration(milliseconds: del != null ? del! : 0),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 700))
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: ClipRRect(
                  child: InkWell(
                    splashColor: DailyThingsColors.themeOrange,
                    focusColor: DailyThingsColors.themeOrange,
                    highlightColor: DailyThingsColors.themeOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: isRightBubble
                          ? Radius.zero
                          : const Radius.circular(20),
                      bottomLeft: isRightBubble
                          ? const Radius.circular(20)
                          : Radius.zero,
                    ),
                    onTap: () async {
                      final player = AudioPlayer();

                      try {
                        player.setVolume(0.6);
                        await player.play(AssetSource("audio/tick.mp3"));
                      } catch (error) {
                        if (kDebugMode) {
                          print("Error playing audio: $error");
                        }
                      }
                      fn();
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                          bottomRight: isRightBubble
                              ? Radius.zero
                              : const Radius.circular(20),
                          bottomLeft: isRightBubble
                              ? const Radius.circular(20)
                              : Radius.zero,
                        ),
                        color: DailyThingsColors.themeBeige,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          chat,
                          style: TextStyles.subheadingDark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              backgroundColor: DailyThingsColors.tertiaryGray,
              radius: 12,
              child: Text(
                "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
