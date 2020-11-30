import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/API/employee_data_model.dart';
import 'package:sample/API/employee_data_viewprovider.dart';

class EmployeeData extends StatefulWidget {
  int id;
  EmployeeData({Key key, @required this.id}) : super(key:key);
  State<StatefulWidget> createState()=> _EmployeeData(id: id);
}

class _EmployeeData extends State<EmployeeData>{
  int id;
  _EmployeeData({this.id});

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
            child:Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Expanded(child: Text('Name')),
                    Expanded(child: Text('Age')),
                    Expanded(child: Text('Salary')),
                  ],
                ),
              ),
              FutureBuilder<EmpData>(
                  future:fetchEmpData(id) ,
                  builder: (context,snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                                title: Row(
                                  children: [
                                    Expanded(child: Text(snapshot.data.employeeName)),
                                    Expanded(child: Text('${snapshot.data.employeeAge}')),
                                    Expanded(child: Text('${snapshot.data.employeeSalary}')),
                                  ],
                                )
                            );
                    }else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          )
        ),
        ),
    );
  }
}
