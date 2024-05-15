class CalendarOutPut {
  final int month;
  final List<CalendarDay> data;
  final int year;
  final String currentDayId;

  CalendarOutPut(
      {required this.month,
      required this.data,
      required this.year,
      required this.currentDayId});
}

class CalendarDay {
  final int date;
  final int day;
  final String weekDay;
  final String id;
  final bool pastDate;

  CalendarDay(
      {required this.date,
      required this.day,
      required this.id,
      required this.weekDay,
      required this.pastDate});
}

CalendarOutPut getCalendarView(int month, int year) {
  if (month < 1 || month > 12) {
    throw ArgumentError('Invalid month. Must be between 1 and 12.');
  }

  final daysInMonth = DateTime(year, month + 1, 0).day;

  final List<CalendarDay> days = [];

  final Map<int, String> dayMap = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun',
  };

  final DateTime now = DateTime.now();
  final currentDay = "${now.day}${now.month}${now.year}${dayMap[now.weekday]}";
  for (int day = 1; day <= daysInMonth; day++) {
    final date = DateTime(year, month, day).day;
    final weekday = DateTime(year, month, day).weekday;
    final isPast = year < now.year ||
        (year == now.year && month < now.month) ||
        (year == now.year && month == now.month && day < now.day);

    days.add(CalendarDay(
        date: date,
        day: weekday,
        id: "$date$month$year${dayMap[weekday]}",
        weekDay: dayMap[weekday] ?? "",
        pastDate: isPast));
  }

  return CalendarOutPut(
      month: month, data: days, year: year, currentDayId: currentDay);
}

String getMonthName(int monthNumber) {
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  if (monthNumber < 1 || monthNumber > months.length) {
    return "Invalid month number";
  }

  return months[monthNumber - 1];
}

String getWeekDayName(int weekdayNumber) {
  const weekdays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  if (weekdayNumber < 1 || weekdayNumber > weekdays.length) {
    return "Invalid weekday number";
  }

  return weekdays[weekdayNumber - 1];
}
