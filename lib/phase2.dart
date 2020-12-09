import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/API/followers_list_view.dart';
import 'package:sample/API/postApi_view.dart';
import 'package:sample/API/users_list_view.dart';
import 'package:sample/API/employee_apiview.dart';
import 'API/album_view.dart';
import 'package:sample/mvvm/viewmodel_provider.dart';
import 'package:sample/mvvm/viewmodel_page_home.dart';
import 'package:sample/mvvm/viewmodel_home.dart';
class phase2 extends StatefulWidget{
  State<phase2> createState()=> _State();
}

class _State extends State<phase2>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(title: Text('PHASE-2'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }),),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text('Album-API'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiSample()));
                  },
              ),
              ListTile(
                title: Text('Followers-API'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiFollowers()));
                },
              ),
              ListTile(
                title: Text('UserList-API'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Apisample_3()));
                },
              ),
              ListTile(
                title: Text('Post-API'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PostApi()));
                },
              ),
              ListTile(
                title: Text('Subscription-MVVM'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewModelProvider(
                    viewModel: HomeViewModel(),
                    child: HomePage(),
                  )
                  ));
                },
              ),
              ListTile(
                title: Text('Employees-Api'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiSample_4()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

