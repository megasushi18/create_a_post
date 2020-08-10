import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'custom_padding.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'tags.dart';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CreatePost(),
      ),
    ),
  );
}
class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  File _image;
  final picker = ImagePicker();
  bool _keyboardState;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    super.initState();
    _keyboardState = KeyboardVisibility.isVisible;
    KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        _keyboardState = visible;
      });
    });
  }


  @override

  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomPadding(
                text: 'cancel',
                colorText: Colors.blueGrey,
                width: 68.0,
              ),
              CustomPadding(
                colorBox: Color(0xFF9599C5),
                text: 'Post',
                colorText: Colors.black,
                width: 58.0,
              ),
            ],
          ),
          TextField(
            textAlign: TextAlign.left,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'INSERT TOPIC',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:15.0),
            child:Container(
              height:1.0,
              color:Colors.blueGrey,),),
          TextField(
            textAlign: TextAlign.left,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'What are you thinking? ...',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
          _image == null ? 
          Text('No image selected') 
              : 
          Expanded(child: Image.file(_image)),
          _keyboardState ? Expanded(
            child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Container(
                          child: Icon(Icons.add_a_photo),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: getImage,
                      ),
                      FlatButton(
                        child: Container(
                          child: Icon(Icons.add_photo_alternate),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: getImageGallery,
                      ),
                    ],
                  ),
          ): SizedBox(),
          _keyboardState ? Tags() : SizedBox(),
        ],
      ),
    );
  }
}
