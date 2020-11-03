class Users{
  final int id;
  final String title;
  final String body;

  Users({this.id,this.title,this.body});

  factory Users.fromJson(Map<String, dynamic>json){
    return Users(
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}