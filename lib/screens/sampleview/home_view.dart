import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contacts_listview.dart';
import 'search_listview.dart';
import 'userhome_view.dart'; //navigation pop

class HomeView extends StatefulWidget{
  String value;
  HomeView({Key key,@required this.value}) : super(key:key);
  @override
  State<StatefulWidget>  createState() => new  _State(value: value);
}

class _State extends State<HomeView> {
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
                  title: Text("Home"),
                  leading: IconButton(
                      icon:Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                  ),),
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

