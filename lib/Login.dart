import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/Home.dart';

void main() => runApp(Login());
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State  extends State<Login> {
  String value;
  bool pressed=true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Background color change function.
  void backGroundColor(String buttonName) {
    if(buttonName=="Login")
    {
      if(pressed = false){
        pressed = true;
      }
      else{
        pressed = false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Login"),
            ),
            backgroundColor:  pressed ? Colors.white : Colors.green,
            body : Center(
                child: ListView(
                  shrinkWrap: true,
                  padding:EdgeInsets.all(20.0),
                  children:<Widget> [
                    Container(
                      alignment: Alignment.center,
                      child:CircleAvatar(maxRadius:35,child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/login1.png')
                              )))),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10,5,10,5),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white,
                      elevation: 6.0,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                            hintText: 'Username'),
                        onChanged: (text){
                          value = text;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10,5,10,5),
                    ),
                    Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                          ),
                        )),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10,5,10,5),
                    ),
                    Container(
                        child : MaterialButton(
                            child:Text('Login'),
                            textColor: Colors.white,
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Home(value : value)),
                              );
                            })
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10,10,10,10),
                      child: Text('Forgot Username/Password?',
                        style: TextStyle(color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }}


