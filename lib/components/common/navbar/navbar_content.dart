import 'package:audioplayers/audioplayers.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

class NavbarContent extends ConsumerWidget {
  final Icon icon;
  final String name;
  final int idx;
  const NavbarContent({
    super.key,
    required this.icon,
    required this.name,
    required this.idx,
  });

  void onLanguageChange(WidgetRef ref, int idx) {
    ref.read(tabsProvider.notifier).updateTab(idx);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(tabsProvider);
    return GestureDetector(
      onTap: () async {
        HapticFeedback.lightImpact();
        Vibration.vibrate(amplitude: 20, duration: 40);
        final player = AudioPlayer();
        player.setAudioContext(AudioContext(
            android: const AudioContextAndroid(
                audioFocus: AndroidAudioFocus.none,
                audioMode: AndroidAudioMode.normal,
                contentType: AndroidContentType.sonification,
                usageType: AndroidUsageType.game)));

        try {
          player.setVolume(0.6);
          await player.play(AssetSource("audio/ting.mp3"));
        } catch (error) {
          if (kDebugMode) {
            print("Error playing audio: $error");
          }
        }
        onLanguageChange(ref, idx);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon.icon,
            color: selectedTab.tab != idx
                ? Colors.white54
                : DailyThingsColors.themeOrange,
          ),
          Text(
            name,
            style: selectedTab.tab == idx
                ? TextStyles.bodyNavbarActive
                : TextStyles.body,
          )
        ],
      ),
    );
  }
}
