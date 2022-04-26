import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_generator_latest/splashandhomepage/splashScreen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        hintColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
