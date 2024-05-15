import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/onbaord/onbaord_home.dart';
import 'package:dailythingspro/screens/onbaord/welcome_onboarded_user.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/calendar/calendar_view.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

CalendarOutPut _cal =
    CalendarOutPut(month: 1, data: [], year: 000, currentDayId: "");

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  setInitialView() {
    final now = DateTime.now();

    setState(() {
      _cal = getCalendarView(now.month, now.year);
    });
  }

  @override
  void initState() {
    setInitialView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<int> initialCheck() async {
      String? check = await getDataFromLocalStorage(DailyThingsKeys.allAdded);

      if (check != null) {
        return 1;
      }
      return 0;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(currentDateProvider.notifier).updateID(_cal.currentDayId);
        ref.read(selectedDateProvider.notifier).updateID(_cal.currentDayId);
        print(_cal.currentDayId);
      }
    });

    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    SaturateEffect(duration: Duration(milliseconds: 800)),
                    FadeEffect(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOut)
                  ],
                  child: Image.asset(
                    DailyThingsImages.logo,
                    height: 90,
                  ),
                ),
                Animate(
                  delay: const Duration(milliseconds: 300),
                  effects: const [
                    ShimmerEffect(),
                    FadeEffect(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn),
                  ],
                  child: const Text(
                    "DailyThings",
                    style: TextStyles.splashHeading,
                  ),
                ),
                const Text(
                  "Everything you need in your life",
                  style: TextStyles.body,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 90,
              child: SizedBox(
                width: size.width,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: DailyThingsColors.themeBeige,
                            borderRadius: BorderRadius.circular(50)),
                        child: GestureDetector(
                          onTap: () async {
                            final int res = await initialCheck();
                            if (res == 1) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      child: const WelcomeOnboardedUser(),
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      type: PageTransitionType.fade),
                                  (route) => false);
                              return;
                            }

                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    child: const OnBoardHome(),
                                    curve: Curves.easeInOut,
                                    type: PageTransitionType.rightToLeft),
                                (route) => false);
                          },
                          child: Center(
                            child: Animate(effects: const [
                              FlipEffect(
                                delay: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 900),
                              )
                            ], child: const Icon(Icons.arrow_forward_outlined)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Version 0.0.1",
                        style: TextStyles.caption,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
