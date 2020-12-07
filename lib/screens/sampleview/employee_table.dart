class Employee{
  int id;
  String fname;
  String lname;
  String dept;

  Employee(this.id,this.fname,this.lname,this.dept);

  Map<String,dynamic>toMap(){
    var map=<String,dynamic>{
      'id':id,
      'fname':fname,
      'lname':lname,
      'dept':dept,
    };
    return map;
  }

  Employee.fromMap(Map<String , dynamic>map){
    id=map['id'];
    fname=map['fname'];
    lname=map['lname'];
    dept=map['dept'];

  }
}