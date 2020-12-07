import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/users_list_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Users>> fetchUsers()async {
  final response= await http.get('https://jsonplaceholder.typicode.com/posts');
  if (response.statusCode==200) {
    List jsonResponse= json.decode(response.body);
    return jsonResponse.map((users) => Users.fromJson(users)).toList();
  }
  throw Exception('Unable to load data');
}

ListView listView(data) {
  return ListView.builder(
    itemCount: data.length,
      itemBuilder: (context,index) {
      return _tile(data[index].id,data[index].title,data[index].body);
      });
}

ListTile _tile(int leading,String title, String subtitle)=> ListTile(
  leading: Text('$leading'),
  title: Text(title,style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),),
  subtitle: Text(subtitle),
);