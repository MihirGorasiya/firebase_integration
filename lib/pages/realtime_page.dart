// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealTimePage extends StatefulWidget {
  const RealTimePage({Key? key}) : super(key: key);

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  // final db = FirebaseFirestore.instance;

  String name = "0";
  String mobileName = "";
  String laptopName = "";
  String earphoneName = "";

  final TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontFamily: GoogleFonts.kdamThmor().fontFamily,
  );
  final TextStyle valueStyle = TextStyle(
    color: Colors.cyanAccent,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore Databasr")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  widthFactor: 0,
                  heightFactor: 0,
                  child: RichText(
                    text: TextSpan(
                      text: "Name: ",
                      style: titleStyle,
                      children: [
                        TextSpan(text: name, style: valueStyle),
                        TextSpan(text: "\nMobile Name: ", style: titleStyle),
                        TextSpan(text: mobileName, style: valueStyle),
                        TextSpan(text: "\nLaptop Number: ", style: titleStyle),
                        TextSpan(text: laptopName, style: valueStyle),
                        TextSpan(text: "\nEarphone name: ", style: titleStyle),
                        TextSpan(text: earphoneName, style: valueStyle),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                DatabaseReference dbref =
                    FirebaseDatabase.instance.ref('persons/Boomslang');

                dbref.onValue.listen((event) {
                  final data = event.snapshot.value;

                  var dataE = jsonEncode(data);
                  var dataD = jsonDecode(dataE);

                  name = event.snapshot.key.toString();
                  mobileName = dataD['mobile'];
                  laptopName = dataD['laptop'];
                  earphoneName = dataD['earphone'];
                  setState(() {});
                });
              },
              child: Text("Retrive Data"),
            ),
            ElevatedButton(
              onPressed: () async {
                DatabaseReference dbref =
                    FirebaseDatabase.instance.ref('persons/Boomslang');

                await dbref.update({
                  "laptop": laptopName == "Dell 3578"
                      ? "Apple Macbook pro"
                      : "Dell 3578",
                });
                // setState(() {});
              },
              child: Text("update Data"),
            ),
          ],
        ),
      ),
    );
  }
}




// Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("name: $name"),
//                     Text("mobile Name: $mobileName"),
//                     Text("laptop Name: $laptopName"),
//                     Text("earphone Name: $earphoneName"),
//                   ],
//                 ),