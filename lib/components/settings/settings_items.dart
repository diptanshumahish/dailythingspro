import 'package:dailythingspro/components/common/arrangements/flex_items.dart';
import 'package:dailythingspro/components/common/popups/warning_popup.dart';
import 'package:dailythingspro/components/settings/settings_item.dart';
import 'package:dailythingspro/components/settings/settings_seperator.dart';
import 'package:dailythingspro/screens/onbaord/onbaord_home.dart';
import 'package:dailythingspro/sqflite/daily/daily_db.dart';
import 'package:dailythingspro/sqflite/journal/journal_db.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsItems extends ConsumerWidget {
  const SettingsItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: FlexItems(widgetList: [
          const SettingsSeparator(
              name: "T H E M E   Z O N E", icon: PhosphorIconsRegular.moon),
          SettingsItem(
              fn: () {
                final cTheme = ref.watch(appThemeProvider);
                if (cTheme.id == "dark") {
                  ref.read(appThemeProvider.notifier).updateTheme("light");
                } else {
                  ref.read(appThemeProvider.notifier).updateTheme("dark");
                }
              },
              title: "Change theme",
              details: "switch between dark & light theme",
              icon: PhosphorIconsFill.sun),
          //profile things
          const SettingsSeparator(
              name: "P R O F I L E",
              icon: PhosphorIconsRegular.personSimpleWalk),
          SettingsItem(
              fn: () {
                ref.read(onboardTabsProvider.notifier).updateTab(0);
                ref.read(tabsProvider.notifier).updateTab(0);
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: const OnBoardHome(
                          notFirstTimeDetails:
                              "Re-enter your details to update them ^^",
                          notFirstTimeTitle: "Modify your personal details",
                        ),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.fade),
                    (route) => false);
              },
              title: "Change personal details",
              details: "This will allow you to change personal details",
              icon: PhosphorIconsFill.person),

          const SizedBox(
            height: 10,
          ),
          //delete things
          const SettingsSeparator(
              name: "D A N G E R   Z O N E", icon: Icons.warning),
          SettingsItem(
              fn: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (context) => WarningPopup(
                      fn: () {
                        JournalDB().deleteAll();
                      },
                      ctaText: "Go ahead delete",
                      icon: Icons.delete_forever_rounded,
                      errorHeading: "Are you sure of this?",
                      error:
                          "This will delete all your previous journals, everything till date, this action is not recoverable either. It might not be a good idea to do so I guess."),
                );
              },
              title: "Delete all journals",
              details: "This will delete all journals permanently",
              icon: Icons.delete_forever),

          SettingsItem(
              fn: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (context) => WarningPopup(
                      fn: () {
                        DailyDB().deleteAll();
                      },
                      ctaText: "Go ahead delete",
                      icon: Icons.delete_forever_rounded,
                      errorHeading: "Are you sure of this?",
                      error:
                          "This will delete all your previous daily tasks, everything till date, this action is not recoverable either. It might not be a good idea to do so I guess."),
                );
              },
              title: "Delete all daily tasks",
              details: "This will delete all daily items permanently",
              icon: Icons.delete_forever),
          SettingsItem(
              fn: () async {
                await JournalDB().backupAndShareDatabase();
              },
              title: "Backup Journals",
              details: "Keep a local backup of your journals",
              icon: Icons.backup),
          SettingsItem(
              fn: () async {
                await JournalDB().chooseAndRestoreDatabase();
              },
              title: "Restore Journals",
              details: "Restore journals from your local device",
              icon: Icons.restore),
          const SizedBox(
            height: 10,
          ),
          const SettingsSeparator(
              name: "C O N T A C T", icon: Icons.contact_page),

          SettingsItem(
              fn: () {
                launchUrl(Uri.parse(
                    "mailto:workwithdiptanshu@gmail.com?subject=Suggestions%20for%20dailythings"));
              },
              title: "Suggest some changes/bugs",
              details: "Feel free to reach us to report stuff",
              icon: Icons.mail),
          const SizedBox(
            height: 200,
          )
        ], space: 8),
      ),
    );
  }
}
