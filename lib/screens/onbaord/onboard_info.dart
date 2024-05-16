import 'package:dailythingspro/components/common/bubble/response_bubble.dart';
import 'package:dailythingspro/components/common/bubble/zen_bubble.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardInfo extends ConsumerWidget {
  const OnboardInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ZenBubble(
            chat:
                "Hi, I'm Zen your personal assistant, You will be seeing me quite often here ^^",
            isRightBubble: false,
            profileImageUrl: ""),
        const ZenBubble(
            del: 200,
            profileImageUrl: "",
            isRightBubble: false,
            chat:
                "I run entirely offline, and all information that I ask here will be stored on your device locally, Zen respects your privacy. The questions will be a bit personal, but trust me they will help you 😉"),
        ResponseBubble(
          del: 400,
          isRightBubble: true,
          chat: "I am ready 😎, I'll tap here and start!",
          fn: () {
            ref.read(onboardTabsProvider.notifier).updateTab(1);
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "For more information on privacy visit our priivacy policy page here, tap on the chat bubble on right to continue ahead",
          style: textStyles.caption,
        )
      ],
    );
  }
}
