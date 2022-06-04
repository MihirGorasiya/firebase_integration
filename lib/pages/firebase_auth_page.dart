// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_integration/pages/auth_pages/login_using_email_page.dart';
import 'package:firebase_integration/pages/auth_pages/login_using_gmail.dart';
import 'package:firebase_integration/pages/auth_pages/login_using_phone.dart';

class FirebaseLoginAuth extends StatefulWidget {
  const FirebaseLoginAuth({Key? key}) : super(key: key);

  @override
  _FirebaseLoginAuthState createState() => _FirebaseLoginAuthState();
}

class _FirebaseLoginAuthState extends State<FirebaseLoginAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Authentication"),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text("Email",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Tab(
                  child: Text("Phone",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Tab(
                  child: Text("Google",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginUsingEmail(),
            LoginUsingPhone(),
            LoginUsingGmail(),
          ],
        ),
      ),
    );
  }
}
