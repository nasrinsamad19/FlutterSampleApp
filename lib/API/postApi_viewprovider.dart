import 'dart:convert';
import 'package:http/http.dart'as http;
import 'postApi_model.dart';

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post('https://jsonplaceholder.typicode.com/albums', headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode==201) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}