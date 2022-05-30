// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_integration/pages/firestore_page.dart';
import 'package:firebase_integration/pages/realtime_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_integration/firebase_options.dart';
import 'package:firebase_integration/notification_manager.dart';
import 'package:firebase_integration/pages/admob_ads_page.dart';
import 'package:firebase_integration/pages/firebase_auth_page.dart';
import 'package:firebase_integration/pages/home_page.dart';
import 'package:firebase_integration/pages/local_notification_page.dart';
import 'package:firebase_integration/pages/remote_config_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        // canvasColor: Colors.grey[900],
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/noti_page": (context) => LocalNotificationPage(),
        "/remote": (context) => RemoteConfigPage(),
        "/auth": (context) => FirebaseLoginAuth(),
        "/ad": (context) => AdmobAdsPage(),
        "/firestore": (context) => FirestorePage(),
        "/realtime": (context) => RealTimePage(),
      },
    );
  }
}
