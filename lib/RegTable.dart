class Registration{
  int id;
  String name;
  String email;
  int phoneNo;
  String gender;
  Registration(this.id,this.name,this.email,this.phoneNo);

  Map<String, dynamic>toMap(){
    var map=<String,dynamic>{
      'id':id,
      'name':name,
      'email':email,
      'phoneNo':phoneNo,
      'gender':gender,
    };
    return map;
  }
  Registration.fromMap(Map<String, dynamic>map){
    id=map['id'];
    name=map['name'];
    email=map['email'];
    phoneNo=map['phoneNo'];
    gender=map['gender'];
  }
}