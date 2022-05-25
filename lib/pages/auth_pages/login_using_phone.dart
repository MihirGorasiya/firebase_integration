// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_integration/widgets/user_data_card.dart';

class LoginUsingPhone extends StatefulWidget {
  const LoginUsingPhone({Key? key}) : super(key: key);

  @override
  _LoginUsingPhoneState createState() => _LoginUsingPhoneState();
}

class _LoginUsingPhoneState extends State<LoginUsingPhone> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = "";
  String otp = "";
  String uID = "";
  late String _varificationID;
  bool isPhoneEntered = false;

  Future<String> otpLength() async {
    if (otp.length == 6) {
      return otp;
    } else {
      return '';
    }
  }

  @override
  void initState() {
    if (auth.currentUser != null) {
      phoneNumber = auth.currentUser!.phoneNumber.toString();
      uID = auth.currentUser!.uid;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          UserDataCard(
            credential: "Phone: $phoneNumber",
            uID: uID,
            imageURL:
                "https://cdn.pixabay.com/photo/2020/12/15/10/22/hinata-5833262_960_720.png",
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Phone number",
                label: Text("Phone number"),
              ),
              onChanged: (text) {
                phoneNumber = text;
              },
            ),
          ),
          isPhoneEntered
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your OTP",
                      label: Text("OTP"),
                    ),
                    obscureText: true,
                    onChanged: (text) {
                      otp = text;
                      setState(() {});
                    },
                  ),
                )
              : SizedBox(),
          SizedBox(height: 15),
          //signup Button
          !isPhoneEntered
              ? ElevatedButton(
                  child: Text("Get OTP"),
                  onPressed: () async {
                    FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneNumber,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        await auth.signInWithCredential(credential);
                        isPhoneEntered = true;
                        setState(() {});
                      },
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent:
                          (String varificationId, int? resendToken) async {
                        _varificationID = varificationId;
                        setState(() {});
                      },
                      codeAutoRetrievalTimeout: (time) {},
                    );
                  },
                )
              : SizedBox(),
          SizedBox(height: 15),
          //Login Button
          isPhoneEntered
              ? ElevatedButton(
                  child: Text("Verify OTP"),
                  onPressed: () async {
                    String code = otp;
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: _varificationID, smsCode: code);

                    await auth
                        .signInWithCredential(credential)
                        .whenComplete(() {
                      phoneNumber = auth.currentUser!.phoneNumber.toString();
                      uID = auth.currentUser!.uid;
                      setState(() {});
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
