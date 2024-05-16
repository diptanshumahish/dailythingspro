import 'package:dailythingspro/components/common/bubble/response_bubble.dart';
import 'package:dailythingspro/components/common/bubble/zen_bubble.dart';
import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String name = "";

class OnboardAge extends ConsumerStatefulWidget {
  const OnboardAge({super.key});

  @override
  ConsumerState<OnboardAge> createState() => _OnboardAgeState();
}

class _OnboardAgeState extends ConsumerState<OnboardAge> {
  @override
  void initState() {
    setState(() {
      getString();
    });
    super.initState();
  }

  getString() async {
    String? data = await getDataFromLocalStorage(DailyThingsKeys.userNameKey);
    if (data != null) {
      setState(() {
        name = data;
      });
    }
  }

  setAge(String cat) async {
    await addToLocalStorage(DailyThingsKeys.userAgeKey, cat);
    ref.read(onboardTabsProvider.notifier).updateTab(3);
    if (kDebugMode) {
      print(await getDataFromLocalStorage(DailyThingsKeys.userAgeKey));
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    return Column(
      children: [
        ZenBubble(
            chat: "Hi $name, how old are you?",
            isRightBubble: false,
            profileImageUrl: ""),
        ResponseBubble(
            del: 100,
            chat: "8-14 years",
            isRightBubble: true,
            fn: () {
              setAge("a");
            }),
        ResponseBubble(
            del: 200,
            chat: "14-18 years",
            isRightBubble: true,
            fn: () {
              setAge("b");
            }),
        ResponseBubble(
            del: 300,
            chat: "18-25 years",
            isRightBubble: true,
            fn: () {
              setAge("c");
            }),
        ResponseBubble(
            del: 400,
            chat: "25-35 years",
            isRightBubble: true,
            fn: () {
              setAge("d");
            }),
        ResponseBubble(
            del: 500,
            chat: "35+ years",
            isRightBubble: true,
            fn: () {
              setAge("e");
            }),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Tap on your age group to go ahead",
          style: textStyles.body,
        )
      ],
    );
  }
}
