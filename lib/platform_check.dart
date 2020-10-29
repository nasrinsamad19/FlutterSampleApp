import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart';

class PlatformCheck extends StatefulWidget{
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<PlatformCheck>{
  bool pressed=true;
  _launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Not working';
    }}
    void backGroundColor(String buttonName) {
    if(buttonName=="PLATFORM")
    {
      if (Platform.isAndroid){
        pressed = true;
        _launchURL('https://play.google.com/store/apps/details?id=com.spotify.music');
      }
      else if( Platform.isIOS){
        pressed = false;
        _launchURL('https://apps.apple.com/us/app/spotify-music-and-podcasts/id324684580');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text('PlatformCheck'),
       ),
       backgroundColor: pressed ? Colors.blue : Colors.red,
       body:Center(
         child: ListView(
           shrinkWrap: true,
           padding:EdgeInsets.all(20.0),
           children:<Widget> [
             MaterialButton(
                 child:Text('PLATFORM'),
                 textColor: Colors.white,
                 shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                 color: Colors.black,
                 onPressed: () {
                   backGroundColor('PLATFORM');
                 }),
           ],
         ),
       ),
     ),
   );
  }
}