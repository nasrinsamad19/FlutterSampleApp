import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  SearchList({ Key key }) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();
}
class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text("Contacts", style: TextStyle(color: Colors.white),);
  Icon actionIcon =  Icon(Icons.search, color: Colors.white,);
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";
  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }
  void init() {
    _list = List();
    _list.add("John wally");
    _list.add("Bill gates");
    _list.add("Tim Cook");
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body:  ListView(
        padding:  EdgeInsets.symmetric(vertical: 8.0),
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }
  List<ChildItem> _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }
  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact)).toList();
    }
    else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())){
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }
  Widget buildBar(BuildContext context){
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
           IconButton(icon: actionIcon, onPressed:() {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon =  Icon(Icons.close, color: Colors.white);
                this.appBarTitle = TextField(
                  controller: _searchQuery,
                  style: TextStyle(
                    color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          },),
        ]
    );
  }
  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }
  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(Icons.search, color: Colors.white,);
      this.appBarTitle =
      Text("Search Sample", style:TextStyle(color: Colors.white),);
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/p1.jpg"))
          )
      )
      ),
      title:Text(this.name,
          style:TextStyle(color: Colors.black)),
      trailing:IconButton(
        icon: Icon(Icons.keyboard_arrow_right),
            ),
    );
  }
}
