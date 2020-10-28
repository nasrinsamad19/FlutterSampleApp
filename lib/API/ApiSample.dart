import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ApiModel.dart';
import 'ApiViewProvider.dart';
class ApiSample extends StatefulWidget{
  State<StatefulWidget> createState()=> new _State();
}

class _State extends State<ApiSample>{
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
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
              builder: (context,sanpshot){
              if(sanpshot.hasData){
                return Text(sanpshot.data.title);
              }else if(sanpshot.hasError){
                return Text('${sanpshot.error}');
              }
              return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}