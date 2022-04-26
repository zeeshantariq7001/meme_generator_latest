import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator_latest/screens/mymemes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool imageSelected = true;

  String headerText = '';
  String footerText = '';
  ScreenshotController screenshotController = ScreenshotController();
  File _image;
  Future getimage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                "    CREATE ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                " MEMES",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.black, Colors.white])),
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    children: [
                      _image != null
                          ? Center(
                              child: Image.file(
                                _image,
                                height: 280,
                                width: 330,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 280,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                headerText.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Colors.black87,
                                    ),
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 8.0,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  footerText.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 3.0,
                                        color: Colors.black87,
                                      ),
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 8.0,
                                        color: Colors.black87,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                imageSelected
                    ? Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            onChanged: (val) {
                              setState(() {
                                headerText = val;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Header Text...",
                                prefixIcon: Icon(
                                  Icons.text_fields,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(),
                                fillColor: Colors.black.withOpacity(0.8),
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            onChanged: (val) {
                              setState(() {
                                footerText = val;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Footer Text...",
                                prefixIcon: Icon(
                                  Icons.text_fields,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(),
                                fillColor: Colors.black.withOpacity(0.8),
                                filled: true),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MaterialButton(
                                elevation: 7,
                                minWidth: 150,
                                splashColor: Colors.greenAccent,
                                color: Colors.green,
                                onPressed: () async {
                                  share();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Share",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: MaterialButton(
                                elevation: 7,
                                minWidth: 150,
                                splashColor: Colors.greenAccent,
                                color: Colors.green,
                                onPressed: () async {
                                  save();
//
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])
                    : Container(
                        child: Text("Select an Image to get start"),
                      ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    elevation: 10,
                    height: 30,
                    minWidth: double.infinity,
                    splashColor: Colors.greenAccent,
                    color: Colors.green,
                    onPressed: () {
                      return getimage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Pic Image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void save() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        List<Directory> directory = await getExternalStorageDirectories();
        String d = DateTime.now().microsecondsSinceEpoch.toString();

        final imagePath =
            await File('/storage/emulated/0/Download/$d.jpg').create();
        await imagePath
            .writeAsBytes(image)
            .whenComplete(
                () => Fluttertoast.showToast(msg: "Image saved successfully!"))
            .catchError((e) {
          print(e.toString());
        });
        print(imagePath);
      }
    });
  }

  void share() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (_image != null) {
        final directory = await getApplicationDocumentsDirectory();
        String d = DateTime.now().microsecondsSinceEpoch.toString();

        final imagePath = await File('${directory.path}/image$d.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
