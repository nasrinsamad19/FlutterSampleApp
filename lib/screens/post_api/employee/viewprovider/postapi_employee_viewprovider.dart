import 'dart:convert';
import 'package:http/http.dart'as http;
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Post_api/Employee/model/postapi_employee_model.dart';

Future<EmployeeList> createAlbum(String name, String salary , String age) async {
  final http.Response response = await http.post('http://dummy.restapiexample.com/api/v1/create', headers: < String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: jsonEncode(<String, String>{
      'name': name,
      "salary": salary,
      'age': age
    }),
  );
  print(response.body);
print(response.statusCode);
if (response.statusCode==201) {
    return EmployeeList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create ');
  }
}