// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializationSettingsAndroid));
  }

  // ignore: prefer_final_fields
  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel ID',
    'channel name',
    channelDescription: 'channel description',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotifications() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      "Notification Title",
      "This is the Notification Body!",
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> scheduleNotifications(int min) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Notification Title",
        "This is the Notification Body!",
        // tz.TZDateTime.now(tz.local).,
        tz.TZDateTime.now(tz.local).add(Duration(minutes: min)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

void selectNotification(String payload) {
  //handle your logic here
}
