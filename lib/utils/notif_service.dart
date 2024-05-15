import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class DTNotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails("DT_BASIC", "DAILYTHINGS_BASIC",
            importance: Importance.high,
            colorized: false,
            color: Colors.black,
            channelShowBadge: true,
            visibility: NotificationVisibility.public,
            category: AndroidNotificationCategory.reminder));
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails(),
        payload: payload);
  }

  Future<bool> _requestNotificationPermission() async {
    final status = await Permission.scheduleExactAlarm.request();
    final notificationsEnabled = await Permission.notification.request();
    if (status.isGranted && notificationsEnabled.isGranted) {
      return true;
    } else {
      print("no permission");
      return false;
    }
  }

  Future<void> scheduledNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledNotificationDateTime,
    String? payload,
  }) async {
    if (await _requestNotificationPermission()) {
      await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledNotificationDateTime, tz.local)
            .add(Duration(minutes: 1)),
        await notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    }
  }
}
