import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _images;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _images = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //When selected from Camera
          RaisedButton(
            child: Text('Capture'),
            onPressed: () {
              getImage(true);
            },
          ),
          _images == null ? Container() : Image.file(_images),
          //When selected from gallery
          RaisedButton(
            child: Text('Gallery'),
            onPressed: () {
              getImage(false);
            },
          ),
          _images == null ? Container() : Image.file(_images),
        ],
      );
  }
}
