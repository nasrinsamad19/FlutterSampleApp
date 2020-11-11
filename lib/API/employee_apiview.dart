import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/API/Employees_model.dart';
import 'package:sample/API/employee_viewprovider.dart';

class ApiSample_4 extends StatefulWidget {
  State<StatefulWidget> createState()=> new _State();
}

class _State extends State<ApiSample_4> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employee-Data'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Data>>(
              future: fetchData(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                  List<Data> data = snapshot.data;
                  return listView(data);
                }else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}