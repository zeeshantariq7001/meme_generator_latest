import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meme_generator_latest/screens/ImagePage.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _futureGetPath;
  List<dynamic> listImagePath = List<dynamic>();
  var _permissionStatus;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();

    _futureGetPath = _getPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "        MY ",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "MEMES ",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: _futureGetPath,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var dir = Directory(snapshot.data);
                  print('permission status: $_permissionStatus');
                  if (_permissionStatus) _fetchFiles(dir);
                  return Text('');
                } else {
                  return Text("Loading");
                }
              },
            ),
          ),
          Expanded(
            flex: 19,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: _getListImg(listImagePath),
            ),
          )
        ],
      ),
    );
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.storage.request().isGranted;
    setState(() => _permissionStatus = status);
  }

  Future<String> _getPath() {
    return ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
  }

  _fetchFiles(Directory dir) {
    List<dynamic> listImage = List<dynamic>();
    dir.list().forEach((element) {
      RegExp regExp =
          new RegExp("\.(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);
      if (regExp.hasMatch('$element')) listImage.add(element);
      setState(() {
        listImagePath = listImage;
      });
    });
  }

  List<Widget> _getListImg(List<dynamic> listImagePath) {
    List<Widget> listImages = List<Widget>();
    for (var imagePath in listImagePath) {
      listImages.add(
        Container(
          padding: const EdgeInsets.all(8),
          child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return ImagesPage(imagePath);
                    });
              },
              child: Image.file(imagePath, fit: BoxFit.cover)),
        ),
      );
    }
    return listImages;
  }
}
