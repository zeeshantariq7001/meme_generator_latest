import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meme_generator_latest/screens/ImagepickerScreen.dart';
import 'package:meme_generator_latest/splashandhomepage/HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () =>
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
              return HomePage();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF05a239),
        body: Stack(
          children: [
            Image.asset(
              "images/splash.jpg",
              fit: BoxFit.fitHeight,
            ),
            Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ))
          ],
        ));
  }
}
