import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class OrientationCheck extends StatefulWidget{
  void main(){
    WidgetsFlutterBinding.ensureInitialized();


}
  State<StatefulWidget> createState()=> _State();
}
class _State extends State<OrientationCheck>{

  File _image;
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
                ),
                RaisedButton(
                  child: Text("Landscape"),
                  onPressed: (){
                    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
                  },

                ),
                RaisedButton(
                  child: Text("Portrait"),
                  onPressed: (){
                    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                  },

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