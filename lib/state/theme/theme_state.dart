import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeCurrent {
  final String id;

  ThemeCurrent({
    required this.id,
  });
}

class ThemeCurrentNotifier extends StateNotifier<ThemeCurrent> {
  ThemeCurrentNotifier() : super(ThemeCurrent(id: "")) {
    getThemeFromLocal();
  }

  Future<void> getThemeFromLocal() async {
    final theme = await getDataFromLocalStorage(DailyThingsKeys.userTheme);
    if (theme != null) {
      state = ThemeCurrent(id: theme);
    } else {
      state = ThemeCurrent(id: "light");
    }
  }

  void updateTheme(String theme) {
    state = ThemeCurrent(id: theme);
  }
}
