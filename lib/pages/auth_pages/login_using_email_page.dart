// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables, unnecessary_null_comparison, prefer_if_null_operators

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_integration/widgets/user_data_card.dart';

class LoginUsingEmail extends StatefulWidget {
  const LoginUsingEmail({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginUsingEmail> createState() => _LoginUsingEmailState();
}

class _LoginUsingEmailState extends State<LoginUsingEmail> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String emailAddress = "";
  String password = "";
  String uID = "";

  @override
  void initState() {
    if (auth.currentUser != null) {
      emailAddress = auth.currentUser!.email.toString();
      uID = auth.currentUser!.uid;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          UserDataCard(
            credential: "Email: $emailAddress",
            uID: uID,
            imageURL:
                "https://cdn.pixabay.com/photo/2020/12/15/10/22/hinata-5833262_960_720.png",
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                label: Text("Email"),
              ),
              onChanged: (text) {
                emailAddress = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your password",
                label: Text("Password"),
              ),
              obscureText: true,
              onChanged: (text) {
                password = text;
              },
            ),
          ),
          SizedBox(height: 15),
          //signup Button
          ElevatedButton(
            child: Text("Signup Using Email"),
            onPressed: () async {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailAddress, password: password)
                  .whenComplete(() {
                emailAddress =
                    FirebaseAuth.instance.currentUser!.email.toString();
                uID = FirebaseAuth.instance.currentUser!.uid;
                setState(() {});
              });
            },
          ),
          SizedBox(height: 15),
          //Login Button
          ElevatedButton(
            child: Text("Login Using Email"),
            onPressed: () async {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailAddress, password: password)
                  .whenComplete(() {
                emailAddress =
                    FirebaseAuth.instance.currentUser!.email.toString();
                uID = FirebaseAuth.instance.currentUser!.uid;
                setState(() {});
              });
            },
          ),
        ],
      ),
    );
  }
}
