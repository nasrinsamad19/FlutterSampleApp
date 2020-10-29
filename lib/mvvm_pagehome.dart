import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/mvvm_home.dart';
import 'package:sample/mvvm_provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
  HomeViewModel _viewModel;

  @override
  void initState(){
    super.initState();
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init(context);
  }

  @override
  void dispose(){
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM DEMO"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("click"),
              onPressed: (){
                _viewModel.refreshData(context);
                },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: _viewModel.dataStream,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                    if(snapshot.connectionState== ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Text("${snapshot.hasError ? snapshot.error:snapshot.data}",);
                    },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}