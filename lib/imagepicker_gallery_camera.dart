import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ShowImage extends StatefulWidget{
  State<StatefulWidget> createState()=> _State();
}
class _State extends State<ShowImage>{
  File _image;
  //This Function pick image from gallery
  void _openGallery(BuildContext context)async{
  // ignore: deprecated_member_use
  var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    if (picture != null){
      _image =File(picture.path);
    }
    else{
      print("No image selected");
    }
  });
 }
 //This function take image from camera and save it in gallery
  void _takePicture(BuildContext context)async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (picture != null){

        GallerySaver.saveImage(picture.path);
      }
      else{
        print("No image selected");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SelectImage'),
        ),
        body: Center(
            child: ListView(
              shrinkWrap: true,
              padding:EdgeInsets.all(100.0),
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: _image == null ? Text('No image selected') : Image.file(_image),
              ),
              MaterialButton(
                child: Text('Gallery'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed:(){
                  _openGallery(context);
                }
              )
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){

            _takePicture(context);
          } ,
          tooltip :'ImageSelected',
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}