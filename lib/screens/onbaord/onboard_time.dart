import 'package:dailythingspro/components/common/bubble/response_bubble.dart';
import 'package:dailythingspro/components/common/bubble/zen_bubble.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/onbaord/welcome_onboarded_user.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

Time _time = Time(hour: 00, minute: 00);

class OnboardTime extends ConsumerWidget {
  const OnboardTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ZenBubble(
            chat:
                "I'll remind everyday at a particular time to write down some journal, my creators told it's good for you, so at what time should I remind you? 🤗",
            isRightBubble: false,
            profileImageUrl: ""),
        ResponseBubble(
            del: 100,
            chat: "Umm well let me think",
            isRightBubble: true,
            fn: () {
              Navigator.of(context).push(
                showPicker(
                  backgroundColor: DailyThingsColors.backgroundColor,
                  accentColor: DailyThingsColors.themeOrange,
                  cancelStyle: TextStyles.subheading,
                  okStyle: TextStyles.subheading,
                  okText: "Let's go",
                  context: context,
                  value: _time,
                  sunrise: const TimeOfDay(hour: 6, minute: 0),
                  sunset: const TimeOfDay(hour: 18, minute: 0),
                  duskSpanInMinutes: 120,
                  onChange: (Time t) async {
                    await addToLocalStorage(
                        DailyThingsKeys.dailyReminderTimeKey,
                        "${t.hour}:${t.minute}");
                    await addToLocalStorage(DailyThingsKeys.allAdded, "OK");

                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: const WelcomeOnboardedUser(),
                            type: PageTransitionType.rightToLeftWithFade),
                        (route) => false);
                  },
                ),
              );
            }),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Tap on the white bubble to open time picker to chose a time",
          style: TextStyles.body,
        ),
      ],
    );
  }
}
