import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/Contacts.dart';
import 'package:sample/EmployeeHome.dart';
import 'package:sample/Home.dart';
import 'package:sample/Images.dart';
class  DrawerEx extends StatefulWidget{
  State<StatefulWidget> createState()=> new _State();
}
class _State extends State<DrawerEx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Example'),),
      drawer: Drawer(
        child:Column(
          children:<Widget> [
                 UserAccountsDrawerHeader(
                  accountName: Text("Abhishek Mishra"),
                  accountEmail: Text("abhishek99@gmail.com"),
                  decoration:BoxDecoration(color: Colors.blue),
                  currentAccountPicture: CircleAvatar(
                    maxRadius: 75,
                   backgroundColor: Colors.orange,
                    child: Text("A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Images()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Contacts()));
              },
            )
          ],

      ),
      ),

    );
  }
}