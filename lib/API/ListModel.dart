class Album{
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;

  Album({this.login,this.id,this.node_id,this.avatar_url});

  factory Album.fromJson(Map<String, dynamic>json){
    return Album(
      login: json['login'],
      id: json['id'],
      node_id: json['node_id'],
      avatar_url: json['avatar_url'],
    );
  }
}