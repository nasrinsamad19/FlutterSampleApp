import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sample/DrawerEX.dart';
import 'RegTable.dart';
import 'DBhelperRegistration.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:async';

class RegistrationForm extends StatefulWidget{
  final String title;
  RegistrationForm({Key key ,this.title}): super(key:key);
  @override
  State<StatefulWidget> createState(){
    return _State();
}
}

class _State extends State<RegistrationForm>{
  Future<List<Registration>> reg;
  var dBHelper;
  final formKey= new GlobalKey<FormState>();
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneNoController=TextEditingController();
  String _genderstatus='Male';
  int id;
  String name;
  String email;
  int phoneNo;
  String gender;
  bool isUpdating;
  double _progress=0.0;
  bool _autoValidate = false;
  int tag=0;
  int tag1=0;
  int tag2=0;
  @override
  void initState() {
  super.initState();
  dBHelper=DBHelperRegistration();
  isUpdating=false;
  refreshList();
  }

  clearField(){
    nameController.text="";
    emailController.text="";
    phoneNoController.text="";
  }

  refreshList(){
    setState(() {
      reg= dBHelper.getData();
    });
  }

  void _validateInputs() {
    if (formKey.currentState.validate()) {
     //If all data are correct then save data to out variables
      popUp();
      formKey.currentState.save();
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void popUp()async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title :Column(
              children:[
                Text('Registered Successfully!',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ]
          ),
        )
    );
  }

  String validatePhoneNo(String value) {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Phone Number';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void startProgress() {
    if ((tag == 0) && (tag != 1)) {
      double value = 0.0;
      if ((_progress >= value) && (_progress != 0.8999999999999999)) {
        setState(() {
          _progress += 0.3;
          print(_progress);
          print(tag);
        });
      }
    }
  }

  void startProgress1(){
    if ((tag1 == 0) && (tag1 != 1)) {
      double value = 0.0;
      if ((_progress >= value) && (_progress != 0.8999999999999999)) {
        setState(() {
          _progress += 0.3;
          print(_progress);
        });
      }
    }
  }

  void startProgress2(){
    if ((tag2== 0) && (tag2!= 1)) {
      double value = 0.0;
      if ((_progress >= value) && (_progress != 0.8999999999999999)) {
        setState(() {
          _progress += 0.3;
          print(_progress);
        });
      }
    }
  }

  void endProgress(){
    double value = 0.0;
  if ((_progress >= value) && (_progress!= 0.8999999999999999)) {
    setState(() {
      _progress -= 0.3;
      print(_progress);
      tag=0;
    });
  }
}

  void endProgress1(){
    double value = 0.0;
    if ((_progress >= value) && (_progress!= 0.8999999999999999)) {
      setState(() {
        _progress -= 0.3;
        print(_progress);
        tag1=0;
      });
    }
  }

  void endProgress2(){
    double value = 0.0;
    if ((_progress >= value) && (_progress!= 0.8999999999999999)) {
      setState(() {
        _progress -= 0.3;
        print(_progress);
        tag2=0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Registration Form'),backgroundColor: Colors.red,
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop(DrawerEx);
              }),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:Form(
              key: formKey,
              autovalidate: _autoValidate,
              child: SingleChildScrollView(
                child:Align(
                  alignment: Alignment.topLeft,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      TextFormField(
                        maxLength: 10,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(labelText: 'Full Name'),
                        validator: (String arg) {
                          if(arg.length < 3)
                            return 'Name must be more than 2 charater';
                          else
                            return null;
                        },
                        onSaved: (val) => name = val,
                        onFieldSubmitted: (val){
                          if(val.isNotEmpty) {
                            startProgress();
                            tag=1;
                          }},
                        onChanged: (val){
                          if (val.isEmpty )
                          {
                            endProgress();
                          }
                        },
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: validateEmail,
                        onSaved: (val) => email = val,
                        onFieldSubmitted: (val){
                          if(val.isNotEmpty){
                            startProgress1();
                            tag1=1;
                          }
                        },
                          onChanged: (val){
                          if (val.isEmpty )
                            {
                              endProgress1();
                            }
                          },
                      ),
                      TextFormField(
                        maxLength: 10,
                        controller: phoneNoController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        validator: validatePhoneNo,
                        onSaved: (val) => phoneNo = val as int,
                        onFieldSubmitted: (val){
                          if(val.isNotEmpty) {
                            startProgress2();
                            tag2=1;

                          }
                          },
                        onChanged: (val){
                          if (val.isEmpty )
                          {
                            endProgress2();
                          }
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10,5,10,5),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child:Text('Gender',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 'Male',
                              groupValue: _genderstatus,
                              onChanged: (value){
                                setState(() {
                                  _genderstatus=value;
                                });
                              }),
                          Text(
                            'Male',
                            style: new TextStyle(fontSize: 17.0),
                          ),
                          Radio(
                              value: 'Female',
                              groupValue: _genderstatus,
                              onChanged: (value){
                                setState(() {
                                  _genderstatus=value;
                                });
                              }
                          ),
                          Text(
                            'Female',
                            style: new TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10,5,10,5),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child:Text('Hobbies',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),),
                      ),
                      CheckboxGroup(
                        labels: <String>[
                          'Blogging',
                          'Volunteering',
                          'Traveling',
                          'Art & Design',
                          'Music',
                          'Reading',
                        ],
                        onSelected:(List<String>checked) =>print(checked.toString()),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10,5,10,5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new LinearProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                          value: _progress,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          OutlineButton(
                            highlightedBorderColor: Colors.black,
                            color: Colors.red,
                            child: const Text('Register'),
                            onPressed:
                              _validateInputs,

                            borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                              width: 0.8,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
