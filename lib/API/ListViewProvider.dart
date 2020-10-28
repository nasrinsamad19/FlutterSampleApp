import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListModel.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
Future<List<Album>> fetchAlbum()async{
  final response = await http.get('https://api.github.com/users/mojombo/followers');
  if(response.statusCode==200){
    List jsonResponse= json.decode(response.body);
    return jsonResponse.map((album)=> new Album.fromJson(album)).toList();
  }
  throw Exception('failed to load data');
}

ListView listView(data){
  return ListView.builder(
    itemCount: data.length,
      itemBuilder: (context,index){
      return _title(data[index].avatar_url,data[index].login);
      });
}

ListTile _title(String leading, String title)=> ListTile(
  leading:CircleAvatar(child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(leading))
            )
        )
        ),
  title: Text(title,
    style: TextStyle(
      fontSize: 20,
    ),
  ),
);
