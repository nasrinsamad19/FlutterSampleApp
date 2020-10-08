import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/DrawerEX.dart';

class GridViewEx extends StatefulWidget{
  State<StatefulWidget> createState()=> _State();
}
class _State extends State<GridViewEx>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid Layout'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop(DrawerEx());
            }
          ),
        ),
        body: GridView.count(
            padding: EdgeInsets.all(20),
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 11.0,
            childAspectRatio: .58,
            shrinkWrap: true,
            children: [
              Image.asset('assets/images/p1.jpg'),
              Image.asset('assets/images/p2.jpg'),
              Image.asset('assets/images/p4.jpg'),
              Image.asset('assets/images/p5.jpg'),
              Image.asset('assets/images/p6.jpg'),
            ],),
      ),
    );
  }
}