// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_integration/notification_manager.dart';

class LocalNotificationPage extends StatefulWidget {
  const LocalNotificationPage({Key? key}) : super(key: key);

  @override
  State<LocalNotificationPage> createState() => _LocalNotificationPageState();
}

class _LocalNotificationPageState extends State<LocalNotificationPage> {
  NotificationService _notificationService = NotificationService();

  int delayTime = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notification Test"),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      hintText: "delay time in minute",
                      label: Text("Schedule time"),
                    ),
                    onChanged: (value) {
                      delayTime = int.parse(value);
                      setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text("Push Notification"),
                  onPressed: () async {
                    await _notificationService.showNotifications();
                  },
                ),
                ElevatedButton(
                  child: Text("Schedule Notification"),
                  onPressed: () async {
                    await _notificationService.scheduleNotifications(delayTime);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("You'll notify after $delayTime minutes.")),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("Cancel Notification"),
                  onPressed: () async {
                    await _notificationService.cancelAllNotifications();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Your all notifications are canceled out.")),
                    );
                  },
                ),
              ],
            ),
            Text(
              "   Firebase remote notification will notify you every 9 A.M.",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
