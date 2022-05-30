// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextStyle _btnTextStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: EdgeInsets.all(10),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/noti_page');
            },
            child: HomeButtonChild(
                imageUrl: "assets/notification.png",
                btnText: "Local/Remote Notification",
                textStyle: _btnTextStyle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ad');
            },
            child: HomeButtonChild(
                imageUrl: "assets/admob.png",
                btnText: "Admob Integration",
                textStyle: _btnTextStyle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/auth');
            },
            child: HomeButtonChild(
                imageUrl: "assets/auth.png",
                btnText: "Firebase Authentication",
                textStyle: _btnTextStyle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/remote');
            },
            child: HomeButtonChild(
                imageUrl: "assets/remote.png",
                btnText: "Remote Config",
                textStyle: _btnTextStyle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/firestore');
            },
            child: HomeButtonChild(
                imageUrl: "assets/firestore.png",
                btnText: "Firestore Database",
                textStyle: _btnTextStyle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/realtime');
            },
            child: HomeButtonChild(
                imageUrl: "assets/realtime.png",
                btnText: "Real-Time Database",
                textStyle: _btnTextStyle),
          ),
        ],
      ),
    );
  }
}

class HomeButtonChild extends StatelessWidget {
  const HomeButtonChild({
    Key? key,
    required TextStyle textStyle,
    required this.imageUrl,
    required this.btnText,
  })  : _btnTextStyle = textStyle,
        super(key: key);

  final TextStyle _btnTextStyle;
  final String imageUrl;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Image(
            opacity: AlwaysStoppedAnimation<double>(0.50),
            image: AssetImage(imageUrl),
            width: 120,
          ),
        ),
        Center(
          child: Text(btnText, style: _btnTextStyle),
        ),
      ],
    );
  }
}
