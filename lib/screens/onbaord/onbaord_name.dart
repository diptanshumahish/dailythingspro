import 'package:dailythingspro/components/common/bubble/response_bubble.dart';
import 'package:dailythingspro/components/common/bubble/zen_bubble.dart';
import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
import 'package:dailythingspro/components/common/popups/warning_popup.dart';
import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController _nameController = TextEditingController();

class OnBoardName extends ConsumerWidget {
  const OnBoardName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ZenBubble(
            chat:
                "What name should I call you with? Maybe a cute nickname, or anything 🤗",
            isRightBubble: false,
            profileImageUrl: ""),
        ResponseBubble(
            del: 200,
            chat: "Well you can call me, umm 😬",
            isRightBubble: true,
            fn: () {}),
        const SizedBox(
          height: 30,
        ),
        Text(
          "I would like you to call me by the name,",
          style: textStyles.subheading,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
              labelText: "Your name", labelStyle: textStyles.subheading),
          style: textStyles.subheading,
        ),
        const SizedBox(
          height: 10,
        ),
        OffsetFullButton(
            content: "Go Ahead",
            fn: () async {
              if (_nameController.text.isEmpty) {
                showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (context) => const WarningPopup(
                      error:
                          "You haven't entered your name, To start we need a name 🥺, you can also enter your nicknames or any such things"),
                );
              } else {
                await addToLocalStorage(
                    DailyThingsKeys.userNameKey, _nameController.text);
                ref.read(onboardTabsProvider.notifier).updateTab(2);
              }
            })
      ],
    );
  }
}
