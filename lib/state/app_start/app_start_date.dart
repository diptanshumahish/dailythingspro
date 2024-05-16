import 'package:dailythingspro/constants/keys.dart';
import 'package:dailythingspro/utils/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartDate {
  final DateTime date;

  AppStartDate({
    required this.date,
  });
}

class AppStartDateNotifier extends StateNotifier<AppStartDate> {
  AppStartDateNotifier() : super(AppStartDate(date: DateTime.now())) {
    getDateFromLocal();
  }
  Future<void> getDateFromLocal() async {
    final date = await getDataFromLocalStorage(DailyThingsKeys.appStartDate);
    if (date != null) {
      final split = date.split(",");
      state = AppStartDate(
          date: DateTime(
              int.parse(split[0]), int.parse(split[1]), int.parse(split[2])));
    }
  }

  void updatedate(DateTime date) {
    state = AppStartDate(date: date);
  }
}
