import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Post_api/Album/model/postApi_model.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Post_api/Album/viewprovider/postApi_viewprovider.dart';

class PostApi extends StatefulWidget {
  PostApi({Key key}) : super(key: key);

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<PostApi> {
  final TextEditingController txtController = TextEditingController();
  Future<Album> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PostAPI'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
          ),),
        body: Container(
            padding: EdgeInsets.all(20),
          child:Align(
            alignment: Alignment.topLeft,
              child: (_futureAlbum == null)
                  ?Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: txtController,
                    decoration: InputDecoration(hintText: 'Enter title'),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                      child: Text('Submit',style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        setState(() {
                          _futureAlbum=createAlbum(txtController.text);
                        });
                      })
                ],
              )
                  :FutureBuilder<Album>(
                  future: _futureAlbum,
                  builder: (context,snapshot){
                    if (snapshot.hasData){
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  }
              )
          )
        ),
      ),
    );
  }
}
