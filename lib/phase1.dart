import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/drawer.dart';
import 'package:sample/icon_grid_view.dart';
import 'package:sample/registration_view.dart';
import 'package:sample/search_listview.dart';
import 'package:sample/student_dbview.dart';

class phase1 extends StatefulWidget{
  State<phase1> createState()=> _State();
}

class _State extends State<phase1>{
  String value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(title: Text('PHASE-1'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }),
        ),
        body: Center(
          child: ListView(
              children: [
                ListTile(
                  title: Text('Grid'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DrawerEx()));
                  },
                ),
                ListTile(
                  title: Text('IconGrid'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> IconGrid()));
                  },
                ),
                ListTile(
                  title: Text('Registration page'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationForm()));
                  },
                ),
                ListTile(
                  title: Text('Search-list'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchList()));
                  },
                ),
                ListTile(
                  title: Text('Student-Data'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DBTestPage()));
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}