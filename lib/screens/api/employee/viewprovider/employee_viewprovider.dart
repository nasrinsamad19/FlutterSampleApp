import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample/Screens/api/employee/model/Employees_model.dart';

Future<List<Data>> fetchData() async{
    final response = await http.get("https://dummy.restapiexample.com/api/v1/employees");
    if(response.statusCode== 200){
      var jsonresponse = json.decode(response.body)['data'] as List;
      return jsonresponse.map((users) => Data.fromJson(users)).toList();
    }
    throw Exception('Fail to load data');
  }






