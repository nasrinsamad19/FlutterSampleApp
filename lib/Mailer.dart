import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
class Mailer extends StatefulWidget{
  static String route = '/another';
  State<StatefulWidget> createState()=> _State();
}
class _State extends State<Mailer>{
  //this function used to sent mails
  void _mail() async {
    final url = 'mailto:dude@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mail'),),
        body: Center(
          child: RaisedButton(
            child: Text("Mail"),
            onPressed: _mail,
          ),
        ),
      ),
    );
  }
}