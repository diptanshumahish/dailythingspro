import 'package:dailythingspro/utils/calendar/calendar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentDate {
  final String id;

  CurrentDate({
    required this.id,
  });
}

class CurrentDateNotifier extends StateNotifier<CurrentDate> {
  CurrentDateNotifier()
      : super(CurrentDate(
            id: "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${getWeekDayName(DateTime.now().weekday)}")) {
    state = CurrentDate(
        id: "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${getWeekDayName(DateTime.now().weekday)}");
  }
  void updateID(String tabNo) {
    state = CurrentDate(id: tabNo);
  }
}
