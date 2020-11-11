import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample/API/Employees_model.dart';


  Future<List<Data>> fetchData() async{
    final response = await http.get("https://dummy.restapiexample.com/api/v1/employees");

    if(response.statusCode== 200){
      print(response.statusCode);
      var jsonresponse = json.decode(response.body)['data'] as List;
      print(jsonresponse);
     //List<Data> emp= jsonresponse.map((emp) => Data.fromJson(emp)).toList();
      return jsonresponse.map((users) => Data.fromJson(users)).toList();

    }
    throw Exception('Fail to load data');
  }

  ListView listView(data) {
    return ListView.builder(
        itemCount: data == null? 1: data.length+1,
        itemBuilder: (context,index) {
          if(index==0) {
            return Row(
              children: [
                Expanded(child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                    child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ))), ),
                Expanded(child: Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                Expanded(child: Text("Age",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                Expanded(child: Text('Salary',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
              ],
            );
          }
          index -=1;
          return _tile(data[index].profileImage,data[index].employeeName,data[index].employeeAge,data[index].employeeSalary);
        });
  }

  ListTile  _tile(String leading,String title, int subtitle, int trailing )=> ListTile(

    title: Row(children: [
      Expanded(child: CircleAvatar(child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
      image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(leading))
          )
      )
      ), ),
      Expanded(child: Text(title)),
      Expanded(child: Text('$subtitle')),
      Expanded(child: Text('$trailing'),)
    ],)
  );

