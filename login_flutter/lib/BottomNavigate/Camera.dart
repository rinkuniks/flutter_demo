import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _images;

  Future getImage(bool isCamera) async{
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _images = image;
    });
    }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            child: Text('Capture'),
            onPressed: (){
              getImage(true);
            },
          ),
          _images == null? Container() : Image.file(_images),
          // RaisedButton(
          //   child: Text('Capture'),
          //   onPressed: (){
          //     getImage(true);
          //   },
          // ),
          // _images == null? Container() : Image.file(_images),
        ],
      ),
    );
  }
}
