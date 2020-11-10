import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'album_viewmodel.dart';
import 'album_viewprovider.dart';

class ApiSample extends StatefulWidget {
  State<StatefulWidget> createState()=> new _State();
}

class _State extends State<ApiSample> {
  Future<Album> futureAlbum;

  @override
  void initState(){
    super.initState();
    futureAlbum=fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API EXAMPLE',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Api Example'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
              builder: (context,snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
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