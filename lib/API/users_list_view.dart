import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/API/users_list_viewmodel.dart';
import 'package:sample/API/users_list_viewprovider.dart';

class Apisample_3 extends StatefulWidget {
  State<StatefulWidget> createState()=> _State();
}

class _State extends State<Apisample_3> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Users_List'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Users>>(
            future: fetchData(),
            builder: (context,snapshot) {
              if (snapshot.hasData) {
                List<Users> data= snapshot.data;
                return listView(data);
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}