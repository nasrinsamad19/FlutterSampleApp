import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/Screens/api/employee/model/Employees_model.dart';
import 'package:sample/Screens/api/employee/view/employee_url_view.dart';
import 'package:sample/Screens/api/employee/viewprovider/employee_viewprovider.dart';
class ApiSample_4 extends StatefulWidget {
  State<StatefulWidget> createState()=> new _State();
}

class _State extends State<ApiSample_4> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employees'),
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
                  return ListView.builder(
                      itemCount:  data.length,
                      itemBuilder: (context,index) {
                        return ListTile(
                          leading: CircleAvatar(child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(data[index].profileImage)
                                  )))),
                          title: Text(data[index].employeeName),
                          trailing: IconButton(
                              icon:Icon(Icons.arrow_forward),
                              onPressed: (){
                                print(data[index].employeeName);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeData(id: data[index].id,)));
                              }
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}