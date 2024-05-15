import 'package:dailythingspro/components/common/navbar/bottom_navbar.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/screens/main/daily/daily_inner.dart';
import 'package:dailythingspro/screens/main/home/home_inner.dart';
import 'package:dailythingspro/screens/main/journal/journal_inner.dart';
import 'package:dailythingspro/screens/main/settings/settings_inner.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Widget> _pages = [
  const HomeInner(
    key: Key("home"),
  ),
  const JournalInner(
    key: Key("journal"),
  ),
  const DailyInner(
    key: Key("daily"),
  ),
  const SettingsInner(
    key: Key("set"),
  )
];

class HomeMain extends ConsumerStatefulWidget {
  const HomeMain({super.key});

  @override
  ConsumerState<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends ConsumerState<HomeMain> {
  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(tabsProvider);

    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: DailyThingsColors.backgroundColor,
      body: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            final animationOffset = animation.drive(Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ));
            return SlideTransition(
              position: animationOffset,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _pages[pageIndex.tab]),
      extendBody: true,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: BottomNavbar(),
      ),
    );
  }
}
