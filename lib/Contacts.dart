import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //list,navigation to next page,popup used,delete icon wrapped in trailing
import 'package:sample/UserHome.dart';

class List1  {
  final String avatar;
  final String name;
  List1({this.avatar, this.name});
}
List<List1> list1=[
  List1(avatar: "assets/images/p1.jpg", name : 'User1',),
  List1(avatar:"assets/images/p2.jpg", name : 'User2',),
  List1(avatar:"assets/images/p6.jpg", name : 'User3',),
  List1(avatar:"assets/images/p4.jpg", name : 'User4',),
  List1(avatar:"assets/images/p5.jpg", name : 'User5',),
];
class Contacts extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new  _Mstate();
}
class _Mstate extends State<Contacts>{

  var txt;
  String value;
//popUp menu function.
  void popUp(int index)async{
    await showDialog(
        context: context,
        child: new AlertDialog(
        title :Column(
              children:[
                CircleAvatar(child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('${list1[index].avatar}')
                        )))),
                Text('  ${list1[index].name+" "+'is selected'}',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ]
        ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Contacts"),
            ),
            body: Center(
                child: ListView.builder(
                  shrinkWrap: false,
                  padding:  EdgeInsets.all(20),
                  itemCount: list1.length,
                  itemBuilder:(context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('${list1[index].avatar}'))
                            )
                        )
                        ),
                        title: Text('${list1[index].name}',
                          style: TextStyle(
                            color: Colors.black,
                          ),),
                        trailing:Wrap(
                          children:<Widget> [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    UserHome(value: list1[index].name),)
                                );},
                              icon: Icon(Icons.call),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  list1.removeAt(index);
                                });},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                        onTap: (){
                          popUp(index);
                        },
                      ) ,
                    );
                  },
                )
            )
        )
    );
  }
}



