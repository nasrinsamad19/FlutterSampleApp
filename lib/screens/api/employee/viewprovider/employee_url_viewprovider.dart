import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample/Screens/api/employee/model/employee_data_model.dart';

Future<EmpData> fetchEmpData(int id) async{
  var endpointurl = "http://dummy.restapiexample.com/api/v1/employee/";
  var params = id;
  var uri = Uri.http('dummy.restapiexample.com', '/api/v1/employee/${params}');
  final response = await http.get(uri);
  if(response.statusCode== 200){
    var jsonresponse = EmpData.fromJson(jsonDecode(response.body)['data']);
    return jsonresponse;
  }
  throw Exception('Fail to load data');
}