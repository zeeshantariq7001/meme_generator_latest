import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ImagesPage extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();

  final imagepath;
  ImagesPage(this.imagepath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                "       MEME ",
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 360,
                width: 360,
                child: Image.file(
                  imagepath,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      share();
                    },
                    icon: Icon(Icons.share)),
                Text(
                  "Share",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          ],
        ));
  }

  void share() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      {
        /// Share Plugin
        await Share.shareFiles([imagepath.path]);
      }
    });
  }
}
