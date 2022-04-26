import 'package:flutter/material.dart';
import 'package:meme_generator_latest/screens/ImagepickerScreen.dart';
import 'package:meme_generator_latest/screens/mymemes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        HomePageText("PRO", Colors.black),
        HomePageText("MEMES", Colors.green),
        HomePageText("GENERATOR", Colors.black),
        SizedBox(
          height: 80,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: MaterialButton(
              height: 80,
              elevation: 10,
              color: Colors.green,
              shape: StadiumBorder(),
              splashColor: Colors.greenAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return MainPage();
                }));
              },
              child: Row(
                children: [
                  Image.asset(
                    "images/laugh.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Create Memes",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: MaterialButton(
            height: 80,
            elevation: 10,
            color: Colors.green,
            shape: StadiumBorder(),
            splashColor: Colors.greenAccent,
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (c) {
                  return MyHomePage();
                },
              ));
            },
            child: Row(
              children: [
                Image.asset(
                  "images/laugh.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Memes",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  Text HomePageText(String text, Color clr) {
    return Text(
      text,
      style: TextStyle(fontSize: 35, color: clr, fontWeight: FontWeight.bold),
    );
  }
}
