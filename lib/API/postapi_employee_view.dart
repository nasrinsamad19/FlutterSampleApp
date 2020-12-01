import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/API/postapi_employee_viewprovider.dart';
import 'package:sample/API/postapi_employee_model.dart';

class PostApiEmployee extends StatefulWidget {
  PostApiEmployee({Key key}) : super(key: key);

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<PostApiEmployee> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  Future<EmployeeList> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PostAPIEmployee'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),),
        body: Container(
            padding: EdgeInsets.all(20),
            child:Align(
                alignment: Alignment.topLeft,
                child: (_futureAlbum == null)
                    ?Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Enter Name'),
                    ),
                    TextField(
                      controller: salaryController,
                      decoration: InputDecoration(hintText: 'Enter Salary'),
                    ),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(hintText: 'Enter Age'),
                    ),
                    MaterialButton(
                        color: Colors.blue,
                        child: Text('Submit',style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          setState(() {
                            _futureAlbum=createAlbum(nameController.text,salaryController.text,ageController.text);
                          });
                        })
                  ],
                )
                    :FutureBuilder<EmployeeList>(
                    future: _futureAlbum,
                    builder: (context,snapshot){
                      if (snapshot.hasData){
                        return ListTile(
                          title: Row(
                            children: [
                              Expanded(child: Text(snapshot.data.name)),
                              Expanded(child: Text('${snapshot.data.salary}')),
                              Expanded(child: Text('${snapshot.data.age}')),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError){
                        return Text('${snapshot.error}');
                      }
                      return CircularProgressIndicator();
                    }
                )
            )
        ),
      ),
    );
  }
}
