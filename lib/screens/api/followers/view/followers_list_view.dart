import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/followers_list_viewmodel.dart';
import '../viewprovider/followers_list_viewprovider.dart';

class ApiFollowers extends StatefulWidget {
  State<StatefulWidget> createState()=> new _State();
}

class _State extends State<ApiFollowers> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Followers',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Followers'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
              future: fetchAlbum(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                 List<Album> data = snapshot.data;
                 return listView(data);
                }else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}