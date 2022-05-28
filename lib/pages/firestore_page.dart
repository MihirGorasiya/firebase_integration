// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({Key? key}) : super(key: key);

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  final db = FirebaseFirestore.instance;

  String id = "0";

  String userName = "";

  String phoneNumber = "";

  String email = "";

  String isPremiumAccount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore Databasr")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.deepOrange[400],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("id: $id"),
                    Text("username: $userName"),
                    Text("phone Number: $phoneNumber"),
                    Text("email: $email"),
                    Text("is Premium account: $isPremiumAccount"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                await db.collection("user_database").get().then((event) {
                  for (var doc in event.docs) {
                    if (doc.id == "user_data") {
                      var jsonString = jsonEncode(doc.data());
                      var dataJson = jsonDecode(jsonString);
                      id = dataJson['id'].toString();
                      userName = dataJson['username'].toString();
                      email = dataJson['email'].toString();
                      phoneNumber = dataJson['phone_number'].toString();
                      isPremiumAccount = dataJson['premium'].toString();
                    }
                  }
                });
                setState(() {});
              },
              child: Text("Retrive Data"),
            ),
          ],
        ),
      ),
    );
  }
}
