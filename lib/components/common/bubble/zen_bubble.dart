import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ZenBubble extends StatelessWidget {
  final String chat;
  final int? del;
  final bool isRightBubble;
  final String profileImageUrl; // Added for displaying the profile picture

  const ZenBubble(
      {super.key,
      required this.chat,
      required this.isRightBubble,
      required this.profileImageUrl,
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
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: DailyThingsColors.themeOrange,
              radius: 12,
              child: Text(
                "Z",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomRight:
                        isRightBubble ? Radius.zero : const Radius.circular(20),
                    bottomLeft:
                        isRightBubble ? const Radius.circular(20) : Radius.zero,
                  ),
                  color: Colors.white12,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    chat,
                    style: TextStyles.subheading,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
