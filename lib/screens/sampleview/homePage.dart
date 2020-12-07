import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/phase1.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/phase2.dart';

class Home extends StatefulWidget{
  State<StatefulWidget> createState()=> _State();
}

class _State extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('HOME'),
        ),
        body: Center(
          child: Card(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('PHASE 1'),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> phase1()));
                      },
                    ),
                    ListTile(
                      title: Text('PHASE 2'),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> phase2()));
                        },
                    ),
                  ],
                ),
              ),
          ),
        ),
    );
  }
}