import 'package:dailythingspro/components/common/bubble/response_bubble.dart';
import 'package:dailythingspro/components/common/bubble/zen_bubble.dart';
import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/onbaord/welcome_onboarded_user.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

String situation = "allMale";

class OnboardMaritial extends ConsumerStatefulWidget {
  const OnboardMaritial({super.key});

  @override
  ConsumerState<OnboardMaritial> createState() => _OnboardMaritialState();
}

class _OnboardMaritialState extends ConsumerState<OnboardMaritial> {
  @override
  void initState() {
    getBasics();
    super.initState();
  }

  getBasics() async {
    final String? age =
        await getDataFromLocalStorage(DailyThingsKeys.userAgeKey);
    final String? gender =
        await getDataFromLocalStorage(DailyThingsKeys.userGenderKey);
    if (age != null && gender != null) {
      if (gender == "M") {
        switch (age) {
          case "a":
            setState(() {
              situation = "none";
            });
            break;
          case "b":
            setState(() {
              situation = "gf";
            });
            break;
          case "c":
            setState(() {
              situation = "gfMar";
            });
            break;
          case "d":
            setState(() {
              situation = "gfMar";
            });
            break;
          case "e":
            setState(() {
              situation = "marW";
            });
            break;
          default:
            setState(() {
              situation = "none";
            });
            break;
        }
      } else {
        switch (age) {
          case "a":
            setState(() {
              situation = "none";
            });
            break;
          case "b":
            setState(() {
              situation = "bf";
            });
            break;
          case "c":
            setState(() {
              situation = "bfMar";
            });
            break;
          case "d":
            setState(() {
              situation = "bfMar";
            });
            break;
          case "e":
            setState(() {
              situation = "marH";
            });
            break;
          default:
            setState(() {
              situation = "none";
            });
            break;
        }
      }
    }
  }

  updateMarit(String code) async {
    await addToLocalStorage(DailyThingsKeys.userMartialStatus, code);
    ref.read(onboardTabsProvider.notifier).updateTab(5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        situation == "none"
            ? const ZenBubble(
                chat:
                    "That's all I need as of now, we can now start exploring!",
                isRightBubble: false,
                profileImageUrl: "")
            : const SizedBox.shrink(),
        situation == "none"
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: OffsetFullButton(content: "Continue", fn: () {}),
              )
            : const SizedBox.shrink(),
        (situation != "none")
            ? const ZenBubble(
                chat:
                    "Hey a personal question again, what's your relationship status? I can help you with some of these stuff as well :)",
                isRightBubble: false,
                profileImageUrl: "")
            : const SizedBox.shrink(),
        situation != "none"
            ? ResponseBubble(
                chat: "I'm single 😬",
                isRightBubble: true,
                fn: () {
                  updateMarit("s");
                },
                del: 100,
              )
            : const SizedBox.shrink(),
        (situation == "gf" || situation == "gfMar" || situation == "marW")
            ? ResponseBubble(
                chat: "I have a girlfriend 🥺",
                isRightBubble: true,
                fn: () {
                  updateMarit("g");
                },
                del: 100,
              )
            : const SizedBox.shrink(),
        (situation == "gfMar" || situation == "marW")
            ? ResponseBubble(
                chat: "I'm married 💍",
                isRightBubble: true,
                fn: () {
                  updateMarit("w");
                },
                del: 100,
              )
            : const SizedBox.shrink(),
        (situation == "bf" || situation == "bfMar" || situation == "marH")
            ? ResponseBubble(
                chat: "I have a boyfriend 🥺",
                isRightBubble: true,
                fn: () {
                  updateMarit("b");
                },
                del: 100,
              )
            : const SizedBox.shrink(),
        (situation == "bfMar" || situation == "marH")
            ? ResponseBubble(
                chat: "I'm married 💍",
                isRightBubble: true,
                fn: () {
                  updateMarit("h");
                },
                del: 200,
              )
            : const SizedBox.shrink(),
        (situation != "none")
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Don't worry we don't take or store any of your personal information with us in any form, all this information would be stored locally on your devise, helping the app to help you better",
                  style: TextStyles.body,
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
