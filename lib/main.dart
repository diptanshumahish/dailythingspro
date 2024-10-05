import 'package:dailythingspro/constants/theme.dart';
import 'package:dailythingspro/screens/entry/splash_screen.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/notif_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Upgrader.clearSavedSettings();
  await DTNotificationService().initNotifications();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    DTNotificationService().showNotification(body: "Your phone has issues");
  }
  tz.initializeTimeZones();
  DTNotificationService().initNotifications();
  runApp(const ProviderScope(child: DailyThings()));
}

class DailyThings extends ConsumerWidget {
  const DailyThings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
        title: 'DailyThings',
        debugShowCheckedModeBanner: false,
        theme: DailyThingsTheme.theme,
        darkTheme: DailyThingsTheme.lightTheme,
        themeMode: theme.id == "dark" ? ThemeMode.dark : ThemeMode.light,
        home: const SplashScreen());
  }
}
