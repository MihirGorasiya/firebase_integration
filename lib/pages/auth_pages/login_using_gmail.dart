// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors,prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_integration/widgets/user_data_card.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUsingGmail extends StatefulWidget {
  const LoginUsingGmail({Key? key}) : super(key: key);

  @override
  _LoginUsingGmailState createState() => _LoginUsingGmailState();
}

class _LoginUsingGmailState extends State<LoginUsingGmail> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = "";
  String uID = "";
  String imageURL =
      "https://cdn.pixabay.com/photo/2020/12/15/10/22/hinata-5833262_960_720.png";

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() {
      email = auth.currentUser!.email!;
      uID = auth.currentUser!.uid;
      imageURL = auth.currentUser!.photoURL!;
      setState(() {});
    });
  }

  @override
  void initState() {
    if (auth.currentUser != null) {
      email = auth.currentUser!.email.toString();
      uID = auth.currentUser!.uid;
      imageURL = auth.currentUser!.photoURL.toString();
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
            credential: "Email: $email",
            uID: uID,
            imageURL: imageURL,
          ),
          ElevatedButton(
            child: Text("Login Using Gmail"),
            onPressed: signInWithGoogle,
          )
        ],
      ),
    );
  }
}
