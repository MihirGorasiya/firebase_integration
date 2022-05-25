// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:firebase_integration/notification_manager.dart';

class LocalNotificationPage extends StatelessWidget {
  LocalNotificationPage({Key? key}) : super(key: key);
  NotificationService _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notification Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Push Notification"),
              onPressed: () async {
                await _notificationService.showNotifications();
              },
            ),
            ElevatedButton(
              child: Text("Push Notification"),
              onPressed: () async {
                await _notificationService.scheduleNotifications();
              },
            ),
            ElevatedButton(
              child: Text("Push Notification"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
