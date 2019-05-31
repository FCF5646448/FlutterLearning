import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  static const EventChannel eventChannel = const EventChannel('com.pages.your/native_post');

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream(12345).listen(_onEvent,onError: _onError);
  }

  String naviTitle = 'title';

  void _onEvent(Object event) {
    setState(() {
      naviTitle = event.toString();
    });
  }

  void _onError(Object error) {}

  var _imgPath;
  Widget _ImageView(imgPath){
    if (imgPath == null) {
      return Center(
        child: Text('请选择图片或拍照'),
      );
    }else{
      return Image.file(
        imgPath,
      );
    }
  }

  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imgPath = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Material(
        child: new Scaffold(
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(naviTitle),
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed:_openGallery,
                child: Text("相册"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}