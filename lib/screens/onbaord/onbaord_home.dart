import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/onbaord/onbaord_age.dart';
import 'package:dailythingspro/screens/onbaord/onbaord_name.dart';
import 'package:dailythingspro/screens/onbaord/onboard_gender.dart';
import 'package:dailythingspro/screens/onbaord/onboard_info.dart';
import 'package:dailythingspro/screens/onbaord/onboard_marit.dart';
import 'package:dailythingspro/screens/onbaord/onboard_time.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _screens = [
  OnboardInfo(
    key: GlobalObjectKey("One"),
  ),
  OnBoardName(
    key: GlobalObjectKey("Name"),
  ),
  OnboardAge(
    key: GlobalObjectKey("Age"),
  ),
  OnboardGender(
    key: GlobalObjectKey("Gender"),
  ),
  OnboardMaritial(
    key: GlobalObjectKey("Marit"),
  ),
  OnboardTime(
    key: GlobalObjectKey("time"),
  )
];

class OnBoardHome extends ConsumerStatefulWidget {
  final String? notFirstTimeTitle;
  final String? notFirstTimeDetails;
  const OnBoardHome(
      {super.key, this.notFirstTimeTitle, this.notFirstTimeDetails});

  @override
  ConsumerState<OnBoardHome> createState() => _OnBoardHomeState();
}

class _OnBoardHomeState extends ConsumerState<OnBoardHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final activeIndex = ref.watch(onboardTabsProvider);
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      DailyThingsImages.zen,
                      height: 120,
                    ),
                  ),
                  Text(
                    widget.notFirstTimeTitle ?? "First Things first!",
                    style: TextStyles.splashHeading,
                  ),
                  Text(
                    widget.notFirstTimeDetails ??
                        "Let's know each other a bit :)",
                    style: TextStyles.subheading,
                  ),
                  AnimatedSwitcher(
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      duration: const Duration(
                          milliseconds: 900), // Adjust animation duration
                      transitionBuilder: (child, animation) {
                        final animationOffset = animation.drive(Tween(
                          begin: const Offset(0.0, 1.0),
                          end: Offset.zero, // Slide to center
                        ));
                        return SlideTransition(
                          position: animationOffset,
                          child:
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _screens[activeIndex.tab],
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
