import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/contacts_listview.dart';
import 'package:url_launcher/url_launcher.dart'; //data passing,bottom navigation bar

// ignore: must_be_immutable
class UserHome extends StatefulWidget{
  String value;
  UserHome({Key key,@required this.value}) : super(key:key);
  State<StatefulWidget> createState() => new  _State(value: value);
}

class _State extends State<UserHome>{
  String  value;
  final  String  txt1= 'Welcome';
  _State({this.value});
  //Navigation to previous page.
  _onTap(int index) {
    Navigator.of(context,)
        .pop( Contacts());
    }

    //URL navigation.
    _launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Not working';
    }}

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("UserHome"),
        leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            }
        ),
      ),
      body: Center(
          child:ListView(
              shrinkWrap: true,
              padding:EdgeInsets.all(100.0),
          children: [
            Container(
              alignment: Alignment.center,
              child:Text(txt1+" "+value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
            Container(
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Google'),
                textColor: Colors.white,
                onPressed:(){
                  const url = 'https://play.google.com/store/apps/details?id=com.spotify.music';
                  _launchURL(url);
                },
              ))
          ])),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            title: Text("Goto UserHome"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            title: Text("Goto UserHome"),
          ),
        ],
        onTap: _onTap,
      ),
    );
  }
}
