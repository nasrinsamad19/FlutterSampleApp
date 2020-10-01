import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/Contacts.dart';
import 'package:sample/SearchList.dart';
import 'package:sample/UserHome.dart'; //navigation pop

class Home extends StatefulWidget{
  String value;
  Home({Key key,@required this.value}) : super(key:key);
  @override
  State<StatefulWidget>  createState() => new  _State(value: value);
}
class _State extends State<Home> {
  TextEditingController name = new TextEditingController();
  String value;
  String txt='Welcome';
  _State({this.value});
  _onTap(int index) {
    if(index==1)
      {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => UserHome(value: value,)),
        );
      }
    else{
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => Contacts()),
      );
    }

  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Text("Home"),),
          body: Center(
            child: Container(
              alignment: Alignment.center,
              child: Text(txt +" " + value),
            ),
          ),

          bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                title: Text("Contacts"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("UserHome"),
              ),
            ],
            onTap:_onTap ,

            ) ,

    ),
    );
  }
}

