// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigPage extends StatefulWidget {
  const RemoteConfigPage({Key? key}) : super(key: key);

  @override
  _RemoteConfigPageState createState() => _RemoteConfigPageState();
}

class _RemoteConfigPageState extends State<RemoteConfigPage> {
  final remoteConfig = FirebaseRemoteConfig.instance;
  String remoteStringValue = "";
  int remoteIntValue = 0;

  setConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(const {
      "countValue": 10,
      "testString": "hello",
    });

    await remoteConfig.fetchAndActivate();
    remoteStringValue = remoteConfig.getString("testString");
    remoteIntValue = remoteConfig.getInt("countValue");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Config Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  text: "Integer value from remote confing is '",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                        text: remoteIntValue.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    TextSpan(text: "'.\nString value from remote confing is '"),
                    TextSpan(
                        text: remoteStringValue,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    TextSpan(text: "'."),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setConfig();
              },
              child: Text("Get Data from Remote"),
            ),
          ],
        ),
      ),
    );
  }
}


// Text(
//                 "Int value from remote confing is '$remoteIntValue'.\n"
//                 "String value from remote confing is '$remoteStringValue'.",
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),