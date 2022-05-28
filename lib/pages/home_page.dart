// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 36)),
              onPressed: () {
                Navigator.pushNamed(context, '/noti_page');
              },
              child: Text("Local Notification Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 36)),
              onPressed: () {
                Navigator.pushNamed(context, '/remote');
              },
              child: Text("Firebase Remote Config Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 36)),
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
              child: Text("Firebase Authentication Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 36)),
              onPressed: () {
                Navigator.pushNamed(context, '/ad');
              },
              child: Text("Admob Ad Test"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 36)),
              onPressed: () {
                Navigator.pushNamed(context, '/firestore');
              },
              child: Text("Firestore Database"),
            ),
          ],
        ),
      ),
    );
  }
}
