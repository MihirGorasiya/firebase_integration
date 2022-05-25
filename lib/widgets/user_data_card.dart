// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, unnecessary_null_comparison

import 'package:flutter/material.dart';

class UserDataCard extends StatelessWidget {
  const UserDataCard({
    Key? key,
    required this.credential,
    required this.uID,
    required this.imageURL,
  }) : super(key: key);

  final String credential;
  final String uID;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageURL),
              radius: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(thickness: 2),
            ),
            Text(
              credential,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              "UID: $uID",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
