// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class FirebaseNotification extends StatefulWidget {
  const FirebaseNotification({Key? key}) : super(key: key);

  @override
  _FirebaseNotificationState createState() => _FirebaseNotificationState();
}

class _FirebaseNotificationState extends State<FirebaseNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Remote Notificaiton")),
      body: Center(
        child: Column(
          children: [
            Text("Notification Update?"),
          ],
        ),
      ),
    );
  }
}
