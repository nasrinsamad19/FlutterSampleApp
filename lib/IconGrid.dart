import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/DrawerEX.dart';

class IconGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(appBar:  AppBar(
          title: Text(' Icon Grid Layout'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop(DrawerEx());
              }
          ),
        ),
            body: GridView.count(
                crossAxisCount: 3,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: IconGridView(choice: choices[index]),
                  );
                }
                )
            )
        )
    );
  }
}
class IconGridView extends StatelessWidget{
 Choice choice;
 IconGridView({Key key,this.choice}):super(key:key);

  @override
  Widget build(BuildContext context) {
            return Card(
              color: Colors.orange,
              child: Center(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Expanded(child: IconButton(icon:Icon(choice.icon, size:55.0, color: Colors.black45),padding: EdgeInsets.only(right: 30),)),
                    Text(choice.title,style: TextStyle(color: Colors.black45,fontSize: 25), textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
  }
}
class Choice {
  final String title;
  final IconData icon;
  Choice({this.title,this.icon});
}
 List<Choice> choices=<Choice>[
  Choice(title: 'Home',icon: Icons.home),
   Choice(title: 'Contacts', icon: Icons.contacts),
   Choice(title: 'Map',icon: Icons.map),
   Choice(title: 'Phone', icon: Icons.phone),
   Choice(title: 'Camera',icon: Icons.camera_alt),
   Choice(title: 'Settings', icon: Icons.settings),
   Choice(title: 'Album',icon: Icons.photo_album),
   Choice(title: 'WiFi', icon: Icons.wifi),
 ];


