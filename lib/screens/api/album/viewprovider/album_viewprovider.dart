import '../model/album_viewmodel.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

Future<Album> fetchAlbum()async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if(response.statusCode==200){
    return Album.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load data');
}